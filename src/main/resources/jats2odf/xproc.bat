@echo off
cd .
SET CLASSPATH=.
java -jar .\lib\xmlcalabash-1.1.15-97\xmlcalabash-1.1.15-97.jar %* >std 2>err