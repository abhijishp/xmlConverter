@echo off
SET VAR=%cd%
del odf.odt
del /S /Q \jats2odf\jatstemp
call jats2odf/xprocc.bat -i file:%1 jats2odf/pipeline/jats2odf-flat.xpl unzip-invoke=unzip work-dir=file:/C:/jats2odf/jatstemp jats-doc-sysid=foo
cd \jats2odf\jatstemp\out
zip -0 -X odf.odt jats2odf/pipeline/jatstemp/out/mimetype
zip -r odf.odt * -x jats2odf/pipeline/jatstemp/out/mimetype
copy \jats2odf\jatstemp\out\odf.odt %VAR%\jats2odf