import re
import urllib.request

M3U_URL = "https://raw.githubusercontent.com/LITUATUI/M3UPT/refs/heads/main/M3U/M3UPT.m3u"
OUTPUT_FILE = "M3UPT_Kodi.m3u"

def convert_m3u():
    req = urllib.request.Request(M3U_URL, headers={'User-Agent': 'Mozilla/5.0'})
    content = urllib.request.urlopen(req).read().decode('utf-8')

    lines = content.splitlines()
    converted_lines = []
    
    current_headers = []
    current_kodiprops = []

    for line in lines:
        line_str = line.strip()

        if line_str.startswith("#EXTVLCOPT:"):
            opt = line_str.replace("#EXTVLCOPT:", "")
            
            if opt.startswith("http-user-agent="):
                ua = opt.split("=", 1)[1]
                current_headers.append(f"User-Agent={ua}")
            elif opt.startswith("http-referrer="):
                ref = opt.split("=", 1)[1]
                current_headers.append(f"Referer={ref}")
            elif opt.startswith("clearkey="):
                key = opt.split("=", 1)[1]
                current_kodiprops.append("#KODIPROP:inputstream=inputstream.adaptive")
                current_kodiprops.append("#KODIPROP:inputstream.adaptive.license_type=org.w3.clearkey")
                current_kodiprops.append(f"#KODIPROP:inputstream.adaptive.license_key={key}")

        elif line_str.startswith("#EXTINF"):
            converted_lines.append(line_str)

        elif line_str.startswith("http://") or line_str.startswith("https://"):
            # Insert converted KODIPROP tags before the stream URL
            if current_headers:
                header_str = "&".join(current_headers)
                converted_lines.append(f"#KODIPROP:inputstream.adaptive.stream_headers={header_str}")
                current_headers = []

            for prop in current_kodiprops:
                converted_lines.append(prop)
            current_kodiprops = []

            converted_lines.append(line_str)
        else:
            if line_str and not line_str.startswith("#EXTVLCOPT"):
                converted_lines.append(line_str)

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write("\n".join(converted_lines))

    print(f"Successfully converted playlist to {OUTPUT_FILE}")

if __name__ == "__main__":
    convert_m3u()
