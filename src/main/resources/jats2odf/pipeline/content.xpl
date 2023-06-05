<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:content" xmlns:p="http://www.w3.org/ns/xproc"
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
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
    xmlns:xforms="http://www.w3.org/2002/xforms" version="1.0">

    <p:option name="work-dir" required="true"/>

    <p:import href="tables.xpl"/>
    <p:import href="boxes.xpl"/>
    <p:import href="lists.xpl"/>
    <p:import href="reflist.xpl"/>
    <p:import href="fig.xpl"/>

    <!-- insert the JATS into a template ODF content.xml as a start -->
    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">

                    <xsl:template match="/">
                        <office:document-content>

                            <office:automatic-styles>

                                <style:style style:name="P1" style:family="paragraph"
                                    style:master-page-name="MP0" style:parent-style-name="h1">
                                    <style:paragraph-properties fo:break-before="page"/>
                                </style:style>

                                
                                <style:style style:name="P2" style:family="paragraph"
                                    style:parent-style-name="Standard" style:list-style-name="L1"> </style:style>
                                <text:list-style style:name="L1">
                                    <text:list-level-style-bullet text:level="1"
                                        text:style-name="Bullet_20_Symbols" text:bullet-char="•">
                                        <style:list-level-properties
                                            text:list-level-position-and-space-mode="label-alignment">
                                            <style:list-level-label-alignment
                                                text:label-followed-by="listtab"
                                                text:list-tab-stop-position="1.27cm"
                                                fo:text-indent="-0.635cm" fo:margin-left="1.27cm"/>
                                        </style:list-level-properties>
                                    </text:list-level-style-bullet>
                                    <text:list-level-style-bullet text:level="2"
                                        text:style-name="Bullet_20_Symbols" text:bullet-char="◦">
                                        <style:list-level-properties
                                            text:list-level-position-and-space-mode="label-alignment">
                                            <style:list-level-label-alignment
                                                text:label-followed-by="listtab"
                                                text:list-tab-stop-position="1.905cm"
                                                fo:text-indent="-0.635cm" fo:margin-left="1.905cm"/>
                                        </style:list-level-properties>
                                    </text:list-level-style-bullet>
                                    <text:list-level-style-bullet text:level="3"
                                        text:style-name="Bullet_20_Symbols" text:bullet-char="▪">
                                        <style:list-level-properties
                                            text:list-level-position-and-space-mode="label-alignment">
                                            <style:list-level-label-alignment
                                                text:label-followed-by="listtab"
                                                text:list-tab-stop-position="2.54cm"
                                                fo:text-indent="-0.635cm" fo:margin-left="2.54cm"/>
                                        </style:list-level-properties>
                                    </text:list-level-style-bullet>
                                    <text:list-level-style-bullet text:level="4"
                                        text:style-name="Bullet_20_Symbols" text:bullet-char="•">
                                        <style:list-level-properties
                                            text:list-level-position-and-space-mode="label-alignment">
                                            <style:list-level-label-alignment
                                                text:label-followed-by="listtab"
                                                text:list-tab-stop-position="3.175cm"
                                                fo:text-indent="-0.635cm" fo:margin-left="3.175cm"/>
                                        </style:list-level-properties>
                                    </text:list-level-style-bullet>
                                    <text:list-level-style-bullet text:level="5"
                                        text:style-name="Bullet_20_Symbols" text:bullet-char="◦">
                                        <style:list-level-properties
                                            text:list-level-position-and-space-mode="label-alignment">
                                            <style:list-level-label-alignment
                                                text:label-followed-by="listtab"
                                                text:list-tab-stop-position="3.81cm"
                                                fo:text-indent="-0.635cm" fo:margin-left="3.81cm"/>
                                        </style:list-level-properties>
                                    </text:list-level-style-bullet>
                                    <text:list-level-style-bullet text:level="6"
                                        text:style-name="Bullet_20_Symbols" text:bullet-char="▪">
                                        <style:list-level-properties
                                            text:list-level-position-and-space-mode="label-alignment">
                                            <style:list-level-label-alignment
                                                text:label-followed-by="listtab"
                                                text:list-tab-stop-position="4.445cm"
                                                fo:text-indent="-0.635cm" fo:margin-left="4.445cm"/>
                                        </style:list-level-properties>
                                    </text:list-level-style-bullet>
                                    <text:list-level-style-bullet text:level="7"
                                        text:style-name="Bullet_20_Symbols" text:bullet-char="•">
                                        <style:list-level-properties
                                            text:list-level-position-and-space-mode="label-alignment">
                                            <style:list-level-label-alignment
                                                text:label-followed-by="listtab"
                                                text:list-tab-stop-position="5.08cm"
                                                fo:text-indent="-0.635cm" fo:margin-left="5.08cm"/>
                                        </style:list-level-properties>
                                    </text:list-level-style-bullet>
                                    <text:list-level-style-bullet text:level="8"
                                        text:style-name="Bullet_20_Symbols" text:bullet-char="◦">
                                        <style:list-level-properties
                                            text:list-level-position-and-space-mode="label-alignment">
                                            <style:list-level-label-alignment
                                                text:label-followed-by="listtab"
                                                text:list-tab-stop-position="5.715cm"
                                                fo:text-indent="-0.635cm" fo:margin-left="5.715cm"/>
                                        </style:list-level-properties>
                                    </text:list-level-style-bullet>
                                    <text:list-level-style-bullet text:level="9"
                                        text:style-name="Bullet_20_Symbols" text:bullet-char="▪">
                                        <style:list-level-properties
                                            text:list-level-position-and-space-mode="label-alignment">
                                            <style:list-level-label-alignment
                                                text:label-followed-by="listtab"
                                                text:list-tab-stop-position="6.35cm"
                                                fo:text-indent="-0.635cm" fo:margin-left="6.35cm"/>
                                        </style:list-level-properties>
                                    </text:list-level-style-bullet>
                                    <text:list-level-style-bullet text:level="10"
                                        text:style-name="Bullet_20_Symbols" text:bullet-char="•">
                                        <style:list-level-properties
                                            text:list-level-position-and-space-mode="label-alignment">
                                            <style:list-level-label-alignment
                                                text:label-followed-by="listtab"
                                                text:list-tab-stop-position="6.985cm"
                                                fo:text-indent="-0.635cm" fo:margin-left="6.985cm"/>
                                        </style:list-level-properties>
                                    </text:list-level-style-bullet>
                                </text:list-style>

                                <style:style style:name="unhandled"
                                    style:parent-style-name="DefaultParagraphFont"
                                    style:family="text">
                                    <style:text-properties fo:background-color="#ff0000"/>
                                </style:style>

                            </office:automatic-styles> 

                            <office:body>
                                <office:text text:use-soft-page-breaks="true">
                                    <xsl:copy-of select="/*"/>
                                </office:text>
                            </office:body>
                        </office:document-content>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>

    <!-- preprocessing -->
    <p:delete match="colgroup"/>

     <!-- pre-process to add colgroups tp tables without them -->
    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">

                    <xsl:template match="table[not(colgroup)]">
                        <table>
                            <colgroup>
                                <xsl:for-each select="(.//tbody/tr)[1]/td">
                                    <xsl:choose>
                                        <xsl:when test="@colspan">
                                            <xsl:for-each select="1 to @colspan">
                                                <col width="*"/>
                                            </xsl:for-each>
                                         </xsl:when>
                                         <xsl:otherwise>
                                            <col width="*"/>
                                         </xsl:otherwise>
                                    </xsl:choose>                                                                   
                                </xsl:for-each>
                            </colgroup>
                            <xsl:apply-templates/>
                        </table>
                       

                    </xsl:template>

                    <xsl:template match="@*|*">
                        <xsl:copy>
                            <xsl:apply-templates select="*|@*|text()"/>
                        </xsl:copy>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>
<!--
<p:store name="debugtab" href="debug.xml"/>

<p:identity>
        <p:input port="source">
            <p:pipe step="debugtab" port="result"/>
        </p:input>
    </p:identity>-->

    <!-- pop lists out of paras -->
    <p:wrap wrapper="lp" match="p[list]"/>
    <p:unwrap match="p[parent::lp]"/>
    <p:wrap match="text()[parent::lp]|*[not(self::list) and parent::lp]" wrapper="p"/>
    <p:unwrap match="lp"/>

    <p:rename match="label[ancestor::fig]" new-name="p"/>


    <!-- unwrapping -->
    <p:unwrap match="article|body|back|app-group"/>

    <!-- reflists -->
    <xo:reflist/>



    <!-- add attribute to appendices so when they are renamed to sec elements, we can still ID them -->
    <p:add-attribute match="app" attribute-name="role" attribute-value="app"/>

    <!-- rename appendices to sec elements, so they get hierarchical titling -->
    <p:rename match="app" new-name="sec"/>

    <!-- convert metadata to an overall document heading -->
    <p:delete match="front"/>

    <!-- convert plain paragraphs -->
    <p:rename match="p" new-name="text:p"/>
    <p:add-attribute match="text:p" attribute-name="text:style-name" attribute-value="Normal"/>

    <!-- simple styles -->
    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">

                    <xsl:template match="bold">
                        <text:span text:style-name="bold">
                            <xsl:apply-templates/>
                        </text:span>
                    </xsl:template>

                    <xsl:template match="italic">
                        <text:span text:style-name="italic">
                            <xsl:apply-templates/>
                        </text:span>
                    </xsl:template>

                    <xsl:template match="sup">
                        <text:span text:style-name="sup">
                            <xsl:apply-templates/>
                        </text:span>
                    </xsl:template>

                    <xsl:template match="sub">
                        <text:span text:style-name="sub">
                            <xsl:apply-templates/>
                        </text:span>
                    </xsl:template>

                    <xsl:template match="sc">
                        <text:span text:style-name="sc">
                            <xsl:apply-templates/>
                        </text:span>
                    </xsl:template>

                    <xsl:template match="uri|xref">
                        <text:span>
                            <xsl:apply-templates/>
                        </text:span>
                    </xsl:template>

                    <xsl:template match="@*|*">
                        <xsl:copy>
                            <xsl:apply-templates select="*|@*|text()"/>
                        </xsl:copy>
                    </xsl:template>

                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>

    <!-- captions -->
    <!--   <p:add-attribute match="caption" attribute-name="text:style-name" attribute-value="caption"/>
    <p:rename match="caption" new-name="text:p"/>-->


    <!-- flatten headings -->
    <p:rename match="title[parent::sec]" new-name="text:h"/>
    
    <!-- breaks -->
    <p:rename match="break" new-name="text:line-break"/>

    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">

                    <xsl:template match="text:h">
                        <text:h text:outline-level="{count(ancestor::sec)}"
                            text:style-name="h{count(ancestor::sec)}">
                            <xsl:apply-templates/>
                        </text:h>
                    </xsl:template>

                    <xsl:template match="@*|*">
                        <xsl:copy>
                            <xsl:apply-templates select="*|@*|text()"/>
                        </xsl:copy>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>

    <p:unwrap match="sec"/>

    <xo:tables/>

    <xo:lists/>

    <xo:boxes/>

    <!-- figs -->
    <xo:fig/>



    <!-- graphics -->
    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">

                    <xsl:template match="graphic">
                        <xsl:variable name="name" select="concat('g',count(preceding::graphic))"/>
                        <draw:frame draw:style-name="a0" draw:name="{$name}"
                            text:anchor-type="as-char" svg:x="0in" svg:y="0in" svg:width="6.26806in"
                            svg:height="3.52569in" style:rel-width="scale" style:rel-height="scale">
                            <draw:image xlink:href="{@xlink:href}" xlink:type="simple"
                                xlink:show="embed" xlink:actuate="onLoad"/>
                            <svg:title/>
                            <svg:desc/>
                        </draw:frame>
                    </xsl:template>

                    <xsl:template match="@*|*">
                        <xsl:copy>
                            <xsl:apply-templates select="*|@*|text()"/>
                        </xsl:copy>
                    </xsl:template>

                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>

    <!-- ext-links -->
    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">
                    <xsl:template match="ext-link">
                        <text:a xlink:show="replace" office:target-frame-name="_top"
                            xlink:href="{@xlink:href}">
                            <text:span text:style-name="Hyperlink">
                                <xsl:value-of select="."/>
                            </text:span>
                        </text:a>
                    </xsl:template>

                    <xsl:template match="@*|*">
                        <xsl:copy>
                            <xsl:apply-templates select="*|@*|text()"/>
                        </xsl:copy>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>

    <p:wrap match="ext-link" wrapper="text:a"/>
    <p:add-attribute match="ext-link" attribute-name="office:target-frame-name"
        attribute-value="_top"/>
    <p:add-attribute match="ext-link" attribute-name="xlink:show" attribute-value="replace"/>
    <p:rename match="ext-link" new-name="text:a"/>


    <!-- title material -->
    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">
                    <xsl:template match="office:body">
                        <office:body>
                            <text:p text:style-name="P1">
                                <xsl:value-of select="//article-title"/>
                            </text:p>
                            <xsl:copy-of select="*"/>
                        </office:body>
                    </xsl:template>

                    <xsl:template match="@*|*">
                        <xsl:copy>
                            <xsl:apply-templates select="*|@*|text()"/>
                        </xsl:copy>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>
  

    <!-- spurious empty paras -->
    <p:delete match="text:p[normalize-space(.)='' and parent::office:body]"/>

    <!-- tidy -->
    <p:delete match="*/@content-type"/>
    <p:delete match="text:p/@id"/>
    <p:delete match="table:table-cell/@id"/>
    <p:delete match="table:table-cell/@valign"/>
    <p:delete match="table:table-row/@id"/>
    <p:delete match="table:table-header-rows/@id"/>
    <p:delete match="table:table-columns/@id"/>
    <p:delete match="text:list-item/@id"/>
    <p:delete match="text:list/@id"/>
    <p:delete match="table:table/@id"/>

    <!-- wrap stray a elements 
    <p:wrap
        match="text:a[not(parent::text:p)]"
        group-adjacent="true()" wrapper="text:p"/>-->
    
    
    <!-- wrap runs in cells with paras -->
    <p:wrap
        match="text()[parent::table:table-cell]|text:span[parent::table:table-cell]|text:line-break[parent::table:table-cell]"
        group-adjacent="true()" wrapper="text:p"/>
    

    <!-- unhandled -->
    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">

                    <xsl:template match="*[namespace-uri()='']">
                        <xsl:choose>
                            <xsl:when test="ancestor::text:p or ancestor::text:h">
                                <text:span text:style-name="unhandled">
                                    <xsl:text>[UNHANDLED: </xsl:text>
                                    <xsl:value-of select="local-name()"/>
                                    <xsl:text>]</xsl:text>
                                </text:span>
                            </xsl:when>
                            <xsl:otherwise>
                                <text:p text:style-name="unhandled">
                                    <xsl:text>[UNHANDLED: </xsl:text>
                                    <xsl:value-of select="local-name()"/>
                                    <xsl:text>]</xsl:text>
                                </text:p>
                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:template>
<!--
                    <xsl:template match="text:p[table:table[not (table:table-columns)]]">
                    <text:p text:style-name="unhandled">
                    <xsl:text>[UNHANDLED: Table with no colgroup]</xsl:text>
                    </text:p>
                    </xsl:template> -->


                    <xsl:template match="@*|*">
                        <xsl:copy>
                            <xsl:apply-templates select="*|@*|text()"/>
                        </xsl:copy>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>

    <!-- DEBUG -->
    <!--
    <p:delete match="table:table[not (table:table-columns)]"/> 
    -->
    <!--
        <p:insert match="table:table[not (table:table-columns)]" position="first-child"> 
        -->
    
    
    <!--
        <p:input port="insertion">
         <p:inline><table:table-columns><table:table-column/><table:table-column/><table:table-column/><table:table-column/><table:table-column/><table:table-column/><table:table-column/><table:table-column/><table:table-column/><table:table-column/><table:table-column/></table:table-columns></p:inline>
    </p:input>
    </p:insert> -->
    
    <p:unwrap match="text:p[table:table]"/>

    <p:store name="store-content">
        <p:with-option name="href" select="concat($work-dir,'/out/content.xml')"/>
    </p:store>

    <p:identity>
        <p:input port="source">
            <p:pipe step="store-content" port="result"/>
        </p:input>
    </p:identity>

</p:pipeline>
