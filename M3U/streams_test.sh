#!/bin/bash

cd M3U/

# TVI - update the stream URL of TVI

sed -i "s#wmsAuthSign=[^&]*#wmsAuthSign=$(wget -qO- https://services.iol.pt/matrix?userId -o /dev/null)#g" "TVI.m3u"

# TVI Internacional - update the stream URL of TVI Internacional

sed -i "s#wmsAuthSign=[^&]*#wmsAuthSign=$(wget -qO- https://services.iol.pt/matrix?userId -o /dev/null)#g" "TVI_Internacional.m3u"

# CNN Portugal - update the stream URL of CNN Portugal

sed -i "s#wmsAuthSign=[^&]*#wmsAuthSign=$(wget -qO- https://services.iol.pt/matrix?userId -o /dev/null)#g" "CNN_Portugal.m3u"

exit 0