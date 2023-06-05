rem cd .
rem SET CLASSPATH=.
SET var=%cd%
ECHO %var%
java -cp .\jats2odf\lib\jats4r-validator-1.0.jar;.\jats2odf\lib\xmlcalabash-1.1.16-97\xmlcalabash-1.1.16-97.jar com.xmlcalabash.drivers.Main -Eorg.jats4r.BlankingResolver %* >std 2>err
