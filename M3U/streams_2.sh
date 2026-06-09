#!/bin/bash

# Method 2

# TVI - update the stream URL of TVI

sed -i "s#wmsAuthSign=[^&]*#wmsAuthSign=$(wget -qO- https://services.iol.pt/matrix?userId -o /dev/null)#g" "TVI.m3u8"

# CNN Portugal - update the stream URL of CNN Portugal

sed -i "s#wmsAuthSign=[^&]*#wmsAuthSign=$(wget -qO- https://services.iol.pt/matrix?userId -o /dev/null)#g" "CNN_Portugal.m3u8"

# V+ TVI - update the stream URL of V+ TVI

sed -i "s#wmsAuthSign=[^&]*#wmsAuthSign=$(wget -qO- https://services.iol.pt/matrix?userId -o /dev/null)#g" "Vmais_TVI.m3u8"

# TVI Ficção - update the stream URL of TVI Ficção

sed -i "s#wmsAuthSign=[^&]*#wmsAuthSign=$(wget -qO- https://services.iol.pt/matrix?userId -o /dev/null)#g" "TVI_Ficcao.m3u8"

# TVI Reality - update the stream URL of TVI Reality

sed -i "s#wmsAuthSign=[^&]*#wmsAuthSign=$(wget -qO- https://services.iol.pt/matrix?userId -o /dev/null)#g" "TVI_Reality.m3u8"

# TVI Internacional - update the stream URL of TVI Internacional

sed -i "s#wmsAuthSign=[^&]*#wmsAuthSign=$(wget -qO- https://services.iol.pt/matrix?userId -o /dev/null)#g" "TVI_Internacional.m3u8"

exit 0
