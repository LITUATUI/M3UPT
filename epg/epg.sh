#!/bin/bash

wget -N https://github.com/XMLTV/xmltv/raw/master/grab/pt_meo/tv_grab_pt_meo

perl tv_grab_pt_meo --config-file meo.conf --output epg.xml

gzip -c epg.xml > epg.xml.gz

exit 0
