#!/bin/bash
CLASSPATH=.
java -cp /m25-system/lib/xmlcalabash-1.1.15-97/xmlcalabash-1.1.15-97.jar:/jats2odf/lib/jats4r-validator-1.0.jar com.xmlcalabash.drivers.Main -Eorg.jats4r.BlankingResolver  $*
