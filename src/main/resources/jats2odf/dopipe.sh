cd /jats2odf
rm -f odf.odt
mv -f /jats2odf/pipeline/skeleton /jats2odf/pipeline/skeleton.bak
mv -f /jats2odf/pipeline/__working /jats2odf/pipeline/__working.bak
mkdir /jats2odf/pipeline/skeleton
mkdir /jats2odf/pipeline/__working
./xprocc.sh -i file:etc/config.xml jats2odf/pipeline/jats2odf.xpl jats-package-sysid=$1 unzip-invoke=unzip
# cd /jats2odf/pipeline/skeleton
# zip -0 -X ../../odf.odt mimetype
# zip -r ../../odf.odt * -x mimetype


