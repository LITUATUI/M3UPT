#!/bin/bash

cd EPG && perl tv_grab_pt_meo --config-file meo-pt.conf --output epg-meo-pt.xml && xz -k -f -9 epg-meo-pt.xml && gzip -v9 -c epg-meo-pt.xml > epg-meo-pt.xml.gz

exit 0
