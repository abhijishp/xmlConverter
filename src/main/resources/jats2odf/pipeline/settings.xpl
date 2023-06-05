<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:settings" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:xo="http://xmlopen.org/xproc" version="1.0">
    
    <p:option name="work-dir" required="true"/>

    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="1.0">
                    <xsl:template match="/">
                        <office:document-settings office:version="1.1"/>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>

    <p:store name="store-settings" standalone="true" omit-xml-declaration="false">
        <p:with-option name="href" select="concat($work-dir,'/out/settings.xml')"/>
    </p:store>

    <p:identity>
        <p:input port="source">
            <p:pipe step="store-settings" port="result"/>
        </p:input>
    </p:identity>

</p:pipeline>
