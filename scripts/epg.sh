#!/bin/bash

mono /.wg++/bin/WebGrab+Plus.exe "/.wg++"

gzip -c /.wg++/guide.xml > guide.xml.gz

exit 0
