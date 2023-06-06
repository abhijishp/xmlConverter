@echo off
SET VAR=%cd%
del odf.odt
del /S /Q \jats2odf\jatstemp
call jats2odf/xprocc.bat -i file:%1 jats2odf/pipeline/jats2odf-flat.xpl unzip-invoke=%VAR%\jats2odf\unzip work-dir=file:/C:/jats2odf/jatstemp jats-doc-sysid=foo
cd \jats2odf\jatstemp\out
%VAR%\jats2odf\zip -0 -X odf.odt mimetype
%VAR%\jats2odf\zip -r odf.odt * -x mimetype
copy \jats2odf\jatstemp\out\odf.odt %VAR%\jats2odf