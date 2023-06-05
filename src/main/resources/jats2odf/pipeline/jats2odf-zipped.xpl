<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step"
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
    xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:cx="http://xmlcalabash.com/ns/extensions"
    version="1.0">

    <!-- 
        work-dir - where temp files will go. Two subdirs will be created here:
          * in
          * out
     -->


    <p:option name="jats-package-sysid" required="true"/>
    <p:option name="unzip-invoke" select="'unzip'"/>
    <p:option name="file-sep" required="true"/>
    <p:option name="work-dir" required="true"/>

    <p:import href="fileutils.xpl"/>
    <p:import href="core.xpl"/>

    <p:identity name="driver"/>
    <p:sink/>

    <!-- create the working folders -->

    <cxf:mkdir>
        <p:with-option name="href" select="$work-dir"/>
    </cxf:mkdir>
    <cxf:mkdir name="in-dir">
        <p:with-option name="href" select="concat($work-dir,'/in')"/>
    </cxf:mkdir>


    <!-- massage the result of this, a URL, into a unzip command
        that's system-specific -->
    <p:xslt name="exec-spec">
        <p:with-param name="jats-package-sysid" select="$jats-package-sysid"/>
        <p:with-param name="unzip-invoke" select="$unzip-invoke"/>
        <p:with-param name="work-dir" select="$work-dir"/>
        <p:with-param name="file-sep" select="$file-sep"/>
        <p:input port="source">
            <p:pipe port="result" step="in-dir"/>
        </p:input>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">
                    <xsl:param name="jats-package-sysid"/>
                    <xsl:param name="unzip-invoke"/>
                    <xsl:param name="work-dir"/>
                    <xsl:param name="file-sep"/>
                    <xsl:template match="/">
                        <exec working="{.}">
                            <cmd>
                                <xsl:value-of select="$unzip-invoke"/>
                            </cmd>
                            <args>
                                <xsl:text>-o -qq -d </xsl:text>
                                <xsl:value-of select="concat($work-dir,$file-sep,'in')"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="$jats-package-sysid"/>
                            </args>
                        </exec>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>


    <!-- unzip the JATS package into the working folder -->
    <p:exec name="unzip" result-is-xml="false">
        <p:input port="source">
            <p:empty/>
        </p:input>
        <p:with-option name="command" select="/exec/cmd"/>
        <p:with-option name="args" select="/exec/args"/>
    </p:exec>
    <p:sink/>

    <p:identity>
        <p:input port="source">
            <p:pipe port="result" step="exec-spec"/>
        </p:input>
    </p:identity>

    <!-- find the 'root' folder of the package, then the XML file within -->
    <p:directory-list name="unpacked-listing">
        <p:with-option name="path" select="/exec/@working"/>
    </p:directory-list>

    <!-- list the resources -->
    <!--  <p:directory-list>
        <p:with-option name="path"
            select="concat(/c:directory/@name,/c:directory/c:directory/@name,'/resources')"/>
    </p:directory-list>-->

    <!-- Dealing with resources. Simplify these for copying into a from/to list, 
        for to easy -->
    <!--<p:xslt name="simplify-moves">
        <p:with-param name="work-dir" select="$work-dir"/>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="1.0">
                    <xsl:param name="work-dir"/>
                    <xsl:template match="/">
                        <moves>
                            <xsl:for-each select="//c:file">
                                <xsl:variable name="uri" select="concat(/*/@xml:base,@name)"/>
                                <copy>
                                    <from>
                                        <xsl:value-of select="$uri"/>
                                    </from>
                                    <to>
                                        <xsl:value-of
                                            select="concat(                                            
                                            substring-before($uri,'__working'),
                                            $work-dir,
                                            '/resources/',@name)"
                                        />
                                    </to>
                                </copy>
                            </xsl:for-each>
                        </moves>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>
    -->

    <!-- copy the source package's resource files -->
    <!--<p:for-each>
        <p:iteration-source select="//copy"/>
        
        <cxf:copy name="cp">
            <p:with-option name="href" select="/copy/from"/>
            <p:with-option name="target" select="/copy/to"/>
        </cxf:copy>
        
        <p:identity>
            <p:input port="source">
                <p:pipe port="result" step="cp"/>
            </p:input>
        </p:identity>
        
    </p:for-each> -->
    <!--<p:sink/>-->

    <!-- find the JATS (XML) file -->
    <!--<p:identity>
        <p:input port="source">
            <p:pipe port="result" step="unpacked-listing"/>
        </p:input>
    </p:identity>-->

    <!-- assume it's always in the second-folder down -->
    <p:directory-list>
        <p:with-option name="path"
            select="concat(/c:directory/@xml:base,/c:directory/c:directory/@name)"/>
    </p:directory-list>

    <!-- load it! -->
    <p:load name="jats-source">
        <p:with-option name="href" select="concat(/c:directory/@xml:base,c:directory/c:file/@name)"
        />
    </p:load>

    <!-- transform it -->
    <xo:core>
        <p:with-option name="work-dir" select="$work-dir"/>
    </xo:core>




</p:pipeline>
