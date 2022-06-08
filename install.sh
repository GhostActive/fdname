#! /bin/bash
#
# Copy fdname script to an execuablte path ($PATH)
#

SRC_DIR=$(dirname $(realpath $0))

DST_DIR="/usr/local/bin/"

chmod +x $SRC_DIR/fdname

sudo cp $SRC_DIR/fdname $DST_DIR
