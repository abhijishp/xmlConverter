<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:meta" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:cxf="http://xmlcalabash.com/ns/extensions/fileutils"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xo="http://xmlopen.org/xproc" xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
    xmlns:anim="urn:oasis:names:tc:opendocument:xmlns:animation:1.0"
    xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0"
    xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0"
    xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
    xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
    xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"
    xmlns:math="http://www.w3.org/1998/Math/MathML"
    xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0"
    xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0"
    xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0"
    xmlns:smil="urn:oasis:names:tc:opendocument:xmlns:smil-compatible:1.0"
    xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
    xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    xmlns:xforms="http://www.w3.org/2002/xforms" version="1.0">

    <p:option name="work-dir" required="true"/>

    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="1.0">
                    <xsl:template match="/">
                        <office:document-meta
                            xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
                            xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0"
                            xmlns:dc="http://purl.org/dc/elements/1.1/"
                            xmlns:xlink="http://www.w3.org/1999/xlink" office:version="1.1">
                            <office:meta>
                                <meta:generator>JATS2ODF</meta:generator>
                                <meta:initial-creator>
                                    <xsl:text>International Baccalaureate Organization</xsl:text>
                                </meta:initial-creator>
                                <dc:creator>
                                    <xsl:text>International Baccalaureate Organization</xsl:text>
                                </dc:creator>
                                <meta:creation-date>
                                    <xsl:value-of select="current-dateTime()"/>
                                </meta:creation-date>
                                <dc:date>
                                    <xsl:value-of select="current-dateTime()"/>
                                </dc:date>
                                <meta:template xlink:href="Normal.dotm" xlink:type="simple"/>
                                <meta:editing-cycles>1</meta:editing-cycles>
                                <meta:editing-duration>PT0S</meta:editing-duration>
                                <meta:document-statistic meta:page-count="" meta:paragraph-count=""
                                    meta:word-count="" meta:character-count="" meta:row-count=""
                                    meta:non-whitespace-character-count=""/>
                            </office:meta>
                        </office:document-meta>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>

    <p:store name="store-meta" standalone="true" omit-xml-declaration="false">
        <p:with-option name="href" select="concat($work-dir,'/out/meta.xml')"/>
    </p:store>

    <p:identity>
        <p:input port="source">
            <p:pipe step="store-meta" port="result"/>
        </p:input>
    </p:identity>

</p:pipeline>
