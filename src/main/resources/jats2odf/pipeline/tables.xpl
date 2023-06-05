<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:tables" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
    xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
    xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
    xmlns:xo="http://xmlopen.org/xproc" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    version="1.0">

    <!-- tables -->
    <p:unwrap match="table-wrap|tbody"/>
    <p:rename match="tbody" new-name="table:table-row-group"/>
    <p:rename match="table" new-name="table:table"/>
    <p:rename match="thead" new-name="table:table-header-rows"/>
    <p:rename match="tr" new-name="table:table-row"/>
    <p:rename match="th|td" new-name="table:table-cell"/>
    <p:rename match="colgroup" new-name="table:table-columns"/>
    <p:rename match="col" new-name="table:table-column"/>

   

    <!-- put table cell text content in paras when not wrapped -->
    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">

                    <xsl:template match="table:table-cell[not(text:p)]">
                        <table:table-cell>
                            <xsl:copy-of select="@*"/>
                            <text:p>
                                <xsl:copy-of select="./text()|*"/>
                            </text:p>
                        </table:table-cell>

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

    

    <!-- styles -->
    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">

                    <!-- generate column spec and style; style will be moved to correct place in next step -->
                    <xsl:template match="table:table-column">
                        <xsl:variable name="sname"
                            select="concat('colstyle-',count(preceding::node()))"/>
                        <table:table-column table:style-name="{$sname}"/>
                        <style:style style:name="{$sname}" style:family="table-column">
                            <style:table-column-properties>
                                <!--<xsl:if test="matches(@width,'%$')">
                                    <xsl:attribute name="style:rel-column-width">
                                        <xsl:value-of select="substring-before(@width,'%')"/>
                                        <xsl:text>*</xsl:text>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="not(matches(@width,'%$'))">
                                    <xsl:attribute name="style:column-width">
                                        <xsl:text>0.0875in</xsl:text>
                                    </xsl:attribute>
                                </xsl:if>-->
                                <xsl:attribute name="style:column-width">
                                        <xsl:text>0.0875in</xsl:text>
                                    </xsl:attribute>

                                <!-- TODO: alignment -->
                            </style:table-column-properties>
                        </style:style>
                    </xsl:template>

                    <!-- rows -->
                    <xsl:template match="table:table-row">
                        <xsl:variable name="rname" select="concat('rowstyle-',count(preceding::node()))"/>

                        <table:table-row table:style-name="{$rname}">
                            <style:style style:name="{$rname}" style:family="table-row">
                                <style:table-row-properties/>
                            </style:style>
                        <xsl:apply-templates/>

                        </table:table-row>    
                    </xsl:template>

                    <!-- cells -->
                    <xsl:template match="table:table-cell">
                        <xsl:variable name="cname" select="concat('cellstyle-',count(preceding::node()))"/>

                        <table:table-cell table:style-name="{$cname}">
                            <style:style style:name="{$cname}" style:family="table-cell">
                                <style:table-cell-properties  fo:border="none" fo:padding-top="0in" fo:padding-left="0.0069in" fo:padding-bottom="0in" fo:padding-right="0.0069in"/>
                            </style:style>
                        <xsl:apply-templates/>

                        </table:table-cell>    
                    </xsl:template>

                    <!-- table itself -->
                    <xsl:template match="table:table">
                        <xsl:variable name="tname" select="concat('tblstyle-',count(preceding::node()))"/>

                        <table:table table:style-name="{$tname}">
                            <style:style style:name="{$tname}" style:family="table">
                                <style:table-properties  fo:margin-left="0in" table:align="left"/>
                            </style:style>
                        <xsl:apply-templates/>

                        </table:table>    
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

    <!-- move them -->
    <p:xslt>
        <p:input port="stylesheet">
            <p:inline>
                <xsl:stylesheet version="2.0">

                    <!-- generate column spec and style; style will be moved to correct place in next step -->
                    <xsl:template match="office:automatic-styles">
                        <office:automatic-styles>
                            <xsl:for-each select="following::style:style[ancestor::table:table]">
                                <xsl:copy-of select="."/>
                            </xsl:for-each>
                            <xsl:copy-of select="*"/>
                        </office:automatic-styles>

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
    
    <p:delete match="style:style[ancestor::table:table]"/>


    <!-- spanning -->
    <p:rename new-name="table:number-columns-spanned" match="@colspan"/>
    <p:rename new-name="table:number-rows-spanned" match="@rowspan"/>

    <!-- TODO: tidy -->
    <p:delete match="table:table-cell/@style"/>
    <p:delete match="table:table/@width"/>
    <p:delete match="table:table/@frame"/>
    <p:delete match="table:table/@rules"/>
    <p:delete match="table:table/@border"/>
    <p:delete match="table:table-cell/@align"/>

</p:pipeline>
