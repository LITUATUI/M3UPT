#!/bin/bash

# Method 1

# Update the stream URL of all TVI channels

sed -i "s#wmsAuthSign=[^&]*#wmsAuthSign=$(wget -qO- https://services.iol.pt/matrix?userId -o /dev/null)#g" *.m3u8

exit 0
