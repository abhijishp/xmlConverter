#!/bin/bash
rm -rf /jatstemp
cd /jats2odf
rm odf.odt
./xproc.sh -i $1 pipeline/jats2odf-flat.xpl jats-doc-sysid=$1 file-sep=/ work-dir=/jatstemp unzip-invoke=/usr/bin/unzip
popdir=$(pwd)
cd /jatstemp/out
zip -0 -X odf.odt mimetype
zip -r odf.odt * -x mimetype
mv odf.odt $popdir
cd $popdir

