import base64
import json
import urllib.request

M3U_URL = "https://raw.githubusercontent.com/LITUATUI/M3UPT/refs/heads/main/M3U/M3UPT.m3u"
OUTPUT_FILE = "M3UPT_Kodi.m3u"

def hex_to_base64url(hex_str):
    """Converts a hex string to a base64url-encoded string without padding."""
    raw_bytes = bytes.fromhex(hex_str)
    return base64.urlsafe_b64encode(raw_bytes).decode('utf-8').rstrip('=')

def convert_m3u():
    req = urllib.request.Request(M3U_URL, headers={'User-Agent': 'Mozilla/5.0'})
    content = urllib.request.urlopen(req).read().decode('utf-8')

    lines = content.splitlines()
    converted_lines = []
    
    current_headers = []
    has_clearkey = False
    clearkey_props = []

    for line in lines:
        line_str = line.strip()

        if line_str.startswith("#EXTVLCOPT:"):
            opt = line_str.replace("#EXTVLCOPT:", "")
            
            if opt.startswith("http-user-agent="):
                ua = opt.split("=", 1)[1].strip('"\'')
                current_headers.append(f"User-Agent={ua}")
            elif opt.startswith("http-referrer="):
                ref = opt.split("=", 1)[1].strip('"\'')
                current_headers.append(f"Referer={ref}")
            elif opt.startswith("clearkey="):
                has_clearkey = True
                key_pair = opt.split("=", 1)[1].strip('"\'')
                if ":" in key_pair:
                    key_id_hex, key_hex = key_pair.split(":", 1)
                    
                    kid_b64 = hex_to_base64url(key_id_hex)
                    k_b64 = hex_to_base64url(key_hex)
                    
                    json_clearkey = {
                        "keys": [{
                            "kty": "oct",
                            "kid": kid_b64,
                            "k": k_b64
                        }],
                        "type": "temporary"
                    }
                    
                    clearkey_props.append("#KODIPROP:inputstream=inputstream.adaptive")
                    clearkey_props.append("#KODIPROP:inputstream.adaptive.manifest_type=hls")
                    clearkey_props.append("#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey")
                    clearkey_props.append(f"#KODIPROP:inputstream.adaptive.license_key={json.dumps(json_clearkey)}")

        elif line_str.startswith("#EXTINF"):
            converted_lines.append(line_str)

        elif line_str.startswith("http://") or line_str.startswith("https://"):
            if has_clearkey:
                # 1. DRM Stream: Use #KODIPROP syntax
                for prop in clearkey_props:
                    converted_lines.append(prop)
                
                if current_headers:
                    header_str = "&".join(current_headers)
                    converted_lines.append(f"#KODIPROP:inputstream.adaptive.stream_headers={header_str}")
                
                converted_lines.append(line_str)
            else:
                # 2. Non-DRM Stream (e.g. RTP, SIC): Append headers using Kodi Pipe syntax "|"
                if current_headers:
                    pipe_headers = "&".join(current_headers)
                    converted_lines.append(f"{line_str}|{pipe_headers}")
                else:
                    converted_lines.append(line_str)

            # Reset variables for the next stream
            current_headers = []
            clearkey_props = []
            has_clearkey = False

        else:
            if line_str and not line_str.startswith("#EXTVLCOPT"):
                converted_lines.append(line_str)

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write("\n".join(converted_lines))

    print(f"Successfully converted playlist to {OUTPUT_FILE}")

if __name__ == "__main__":
    convert_m3u()
