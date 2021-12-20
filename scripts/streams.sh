#!/bin/bash

# TVI - retrieve the stream URL, put it in a text file then insert it in the m3u list

sed -i '/live_tvi/d' m3upt.m3u

echo "https://video-auth6.iol.pt/live_tvi/live_tvi/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)" > tvi.txt

sed -i '/"TVI"/r tvi.txt' m3upt.m3u

# CNN Portugal - retrieve the stream URL, put it in a text file then insert it in the m3u list

sed -i '/live_cnn/d' m3upt.m3u

echo "https://video-auth7.iol.pt/live_cnn/live_cnn/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)" > cnn_portugal.txt

sed -i '/"CNN-PT"/r cnn_portugal.txt' m3upt.m3u

# TVI Internacional - retrieve the stream URL, put it in a text file then insert it in the m3u list

sed -i '/live_tvi_internacional/d' m3upt.m3u

echo "https://video-auth6.iol.pt/live_tvi_internacional/live_tvi_internacional/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)" > tvi_internacional.txt

sed -i '/"TVII"/r tvi_internacional.txt' m3upt.m3u

exit 0
