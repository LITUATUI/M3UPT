#!/bin/bash

wget -N https://github.com/XMLTV/xmltv/raw/master/grab/pt_vodafone/tv_grab_pt_vodafone && perl tv_grab_pt_vodafone --config-file vodafone.conf --debug --output epg-vodafone.xml && sed -i '/ottimg/d' epg-vodafone.xml && gzip -c vodafone-epg.xml > epg-vodafone.xml.gz

exit 0