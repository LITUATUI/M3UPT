#!/bin/bash

# Method 3

# TVI - update the stream URL of TVI

sed -i "/live_tvi\/live_tvi/ c https://video-auth6.iol.pt/live_tvi/live_tvi/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)/" M3UPT.m3u

# CNN Portugal - update the stream URL of CNN Portugal

sed -i "/live_cnn/ c https://video-auth7.iol.pt/live_cnn/live_cnn/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)/" M3UPT.m3u

# V+ TVI - update the stream URL of V+ TVI

sed -i "/live_vmais/ c https://video-auth2.iol.pt/live_vmais/live_vmais/edge_servers/vmais-720p/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)/" M3UPT.m3u

# TVI Ficção - update the stream URL of TVI Ficção

sed -i "/live_tvi_ficcao/ c https://video-auth1.iol.pt/live_tvi_ficcao/live_tvi_ficcao/edge_servers/tvificcao-720p/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)/" M3UPT.m3u

# TVI Reality - update the stream URL of TVI Reality

sed -i "/live_tvi_reality/ c https://video-auth4.iol.pt/live_tvi_reality/live_tvi_reality/edge_servers/tvireality-720_passthrough/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)/" M3UPT.m3u

# TVI Internacional - update the stream URL of TVI Internacional

sed -i "/live_tvi_internacional/ c https://video-auth6.iol.pt/live_tvi_internacional/live_tvi_internacional/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)/" M3UPT.m3u

exit 0
