<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:manifest" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:xo="http://xmlopen.org/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">

    <p:option name="work-dir" required="true"/>

    <p:xslt name="manifest">
        <p:with-param name="work-dir" select="$work-dir"/>
        <p:input port="stylesheet">
            <p:inline>

                <xsl:stylesheet version="1.0">

                    <xsl:param name="work-dir"/>

                    <xsl:template match="/">
                        <xsl:variable name="base" select="concat(resolve-uri($work-dir),'/out/')"/>
                        <manifest:manifest
                            xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0">
                            <manifest:file-entry manifest:media-type="text/xml"
                                manifest:full-path="META-INF/manifest.xml"/>
                            <xsl:for-each select="//c:result">
                                <manifest:file-entry>
                                    <xsl:attribute name="manifest:media-type">
                                        <xsl:choose>
                                            <xsl:when test="matches(.,'.xml$')">text/xml</xsl:when>
                                            <xsl:otherwise>text/plain</xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="manifest:full-path">
                                        <xsl:value-of select="substring-after(.,$base)"/>
                                    </xsl:attribute>
                                </manifest:file-entry>
                            </xsl:for-each>

                        </manifest:manifest>

                    </xsl:template>

                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>

    <p:store name="store-manifest" standalone="true" omit-xml-declaration="false">
        <p:with-option name="href" select="concat($work-dir,'/out/META-INF/manifest.xml')"/>
    </p:store>

    <p:identity>
        <p:input port="source">
            <p:pipe step="manifest" port="result"/>
        </p:input>
    </p:identity>

</p:pipeline>
