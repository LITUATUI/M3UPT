#!/bin/bash

# TVI - retrieve the stream URL, put it in a text file then insert it in the m3u list

sed -i '/live_tvi/d' m3upt.m3u

echo "https://video-auth6.iol.pt/live_tvi/live_tvi/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)" > TVI.txt

sed -i '/"TVI"/r TVI.txt' m3upt.m3u

# CNN Portugal - retrieve the stream URL, put it in a text file then insert it in the m3u list

sed -i '/live_cnn/d' m3upt.m3u

echo "https://video-auth7.iol.pt/live_cnn/live_cnn/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)" > CNN_Portugal.txt

sed -i '/"CNN-PT"/r CNN_Portugal.txt' m3upt.m3u

# TVI Internacional - retrieve the stream URL, put it in a text file then insert it in the m3u list

sed -i '/live_tvi_internacional/d' m3upt.m3u

echo "https://video-auth6.iol.pt/live_tvi_internacional/live_tvi_internacional/playlist.m3u8?wmsAuthSign=$(wget https://services.iol.pt/matrix?userId= -o /dev/null -O -)" > TVI_Internacional.txt

sed -i '/"TVII"/r TVI_Internacional.txt' m3upt.m3u

exit 0