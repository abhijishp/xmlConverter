<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:core" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:cxf="http://xmlcalabash.com/ns/extensions/fileutils"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:xo="http://xmlopen.org/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">

    <p:option name="work-dir" required="true"/>

    <p:import href="meta.xpl"/>
    <p:import href="styles.xpl"/>
    <p:import href="content.xpl"/>
    <p:import href="settings.xpl"/>
    <p:import href="mimetype.xpl"/>
    <p:import href="manifest.xpl"/>

    <p:identity name="jats-source"/>
    <p:sink/>

    <cxf:mkdir name="out-dir">
        <p:with-option name="href" select="concat($work-dir,'/out')"/>
    </cxf:mkdir>
    

    <p:identity>
        <p:input port="source">
            <p:pipe port="result" step="jats-source"/>
        </p:input>
    </p:identity>

    <!-- store the MathML as discrete resources -->
    <!-- Step 1: combine the content.xml and the unpacked directory listing -->
    <!--    <p:wrap-sequence wrapper="wrapper">
        <p:input port="source">
            <p:pipe port="result" step="in-dir"/>
            <p:pipe port="result" step="jats-source"/>
        </p:input>
    </p:wrap-sequence>
-->
    <!-- Step 2. Make a "store at" instruction document -->
    <p:xslt>
        <p:with-param name="work-dir" select="$work-dir"/>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="1.0">
                    <xsl:param name="work-dir"/>

                    <xsl:template match="/">
                        <store-ats>
                            <xsl:for-each select="//title">
                                <store-at
                                    href="{concat($work-dir,'/out/math/math',count(preceding::title)+1,'.xml')}">
                                    <xsl:copy-of select="."/>
                                </store-at>
                            </xsl:for-each>
                        </store-ats>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>

    </p:xslt>

    <!-- Step 3. Action it -->
    <p:for-each>
        <p:iteration-source select="//store-at"/>

        <p:identity name="stat"/>
        <p:unwrap name="uw" match="/store-at"/>

        <p:identity>
            <p:input port="source">
                <p:pipe port="result" step="stat"/>
            </p:input>
        </p:identity>

        <p:store name="cs">
            <p:with-option name="href" select="/*/@href"/>
            <p:input port="source">
                <p:pipe port="result" step="uw"/>
            </p:input>

        </p:store>

        <p:identity>
            <p:input port="source">
                <p:pipe port="result" step="cs"/>
            </p:input>
        </p:identity>

    </p:for-each>
    <p:sink/>

    <p:identity>
        <p:input port="source">
            <p:pipe port="result" step="jats-source"/>
        </p:input>
    </p:identity>

    <!-- Construct the ODF metadata -->
    <xo:meta name="meta">
        <p:with-option name="work-dir" select="$work-dir"/>
    </xo:meta>
    <p:sink/>
    <p:identity>
        <p:input port="source">
            <p:pipe port="result" step="jats-source"/>
        </p:input>
    </p:identity>

    <!-- Construct the ODF styles -->
    <xo:styles name="styles">
        <p:with-option name="work-dir" select="$work-dir"/>
    </xo:styles>
    <p:sink/>
    <p:identity>
        <p:input port="source">
            <p:pipe port="result" step="jats-source"/>
        </p:input>
    </p:identity>

    <!-- Construct the ODF settings -->
    <xo:settings name="settings">
        <p:with-option name="work-dir" select="$work-dir"/>
    </xo:settings>
    <p:sink/>
    <p:identity>
        <p:input port="source">
            <p:pipe port="result" step="jats-source"/>
        </p:input>
    </p:identity>

    <!-- Construct the mimetype file -->
    <xo:mimetype name="mimetype">
        <p:with-option name="work-dir" select="$work-dir"/>
    </xo:mimetype>
    <p:sink/>
    <p:identity>
        <p:input port="source">
            <p:pipe port="result" step="jats-source"/>
        </p:input>
    </p:identity>

    <!-- Construct the ODF content -->
    <xo:content name="content">
        <p:with-option name="work-dir" select="$work-dir"/>
    </xo:content>
    <p:sink/>

    <!-- glom together all the files emitted by these processes ... -->
    <p:wrap-sequence wrapper="manifest">
        <p:input port="source">
            <p:pipe port="result" step="meta"/>
            <p:pipe port="result" step="styles"/>
            <p:pipe port="result" step="content"/>
            <p:pipe port="result" step="settings"/>
            <p:pipe port="result" step="mimetype"/>
        </p:input>
    </p:wrap-sequence>

    <!-- ... and make a manifest from them -->
    <xo:manifest name="manifest">
        <p:with-option name="work-dir" select="$work-dir"/>
    </xo:manifest>

</p:pipeline>
