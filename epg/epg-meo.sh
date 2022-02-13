#!/bin/bash

wget -N https://github.com/XMLTV/xmltv/raw/master/grab/pt_meo/tv_grab_pt_meo && perl tv_grab_pt_meo --config-file meo.conf --fast --output epg-meo.xml && gzip -c epg-meo.xml > epg-meo.xml.gz

exit 0
