<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:styles" xmlns:p="http://www.w3.org/ns/xproc"
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
                        <office:document-styles office:version="1.1">
                            <office:font-face-decls>
                                <style:font-face style:name="Calibri" svg:font-family="Calibri"
                                    style:font-family-generic="swiss" style:font-pitch="variable"
                                    svg:panose-1="2 15 5 2 2 2 4 3 2 4"/>
                                <style:font-face style:name="Times New Roman"
                                    svg:font-family="Times New Roman"
                                    style:font-family-generic="roman" style:font-pitch="variable"
                                    svg:panose-1="2 2 6 3 5 4 5 2 3 4"/>
                                <style:font-face style:name="Cambria" svg:font-family="Cambria"
                                    style:font-family-generic="roman" style:font-pitch="variable"
                                    svg:panose-1="2 4 5 3 5 4 6 3 2 4"/>
                            </office:font-face-decls>
                            <office:styles>



                                <style:default-style style:family="table">
<style:table-properties fo:margin-left="0in" table:border-model="collapsing" style:writing-mode="lr-tb" table:align="left"/>
</style:default-style>
<style:default-style style:family="table-column">
<style:table-column-properties style:use-optimal-column-width="true"/>
</style:default-style>
<style:default-style style:family="table-row">
<style:table-row-properties style:min-row-height="0in" style:use-optimal-row-height="true" fo:keep-together="auto"/>
</style:default-style>
<style:default-style style:family="table-cell">
<style:table-cell-properties fo:background-color="transparent" style:glyph-orientation-vertical="auto" style:vertical-align="top" fo:wrap-option="wrap"/>
</style:default-style>

                                <style:default-style style:family="paragraph">

                                    <style:paragraph-properties fo:keep-with-next="auto"
                                        fo:keep-together="auto" fo:widows="2" fo:orphans="2"
                                        fo:break-before="auto" text:number-lines="true"
                                        fo:border="none" fo:padding="0in" style:shadow="none"
                                        style:line-break="strict" style:punctuation-wrap="hanging"
                                        style:text-autospace="ideograph-alpha"
                                        style:snap-to-layout-grid="true" fo:text-align="start"
                                        style:writing-mode="lr-tb" fo:margin-bottom="0.1388in"
                                        fo:line-height="115%" fo:background-color="transparent"
                                        style:tab-stop-distance="0.5in"/>

                                    <style:text-properties style:font-name="Georgia"
                                        style:font-name-asian="Georgia"
                                        style:font-name-complex="Times New Roman"
                                        fo:font-weight="normal" style:font-weight-asian="normal"
                                        style:font-weight-complex="normal" fo:font-style="normal"
                                        style:font-style-asian="normal"
                                        style:font-style-complex="normal" fo:text-transform="none"
                                        fo:font-variant="normal" style:text-line-through-type="none"
                                        style:text-outline="false" style:font-relief="none"
                                        style:use-window-font-color="true"
                                        fo:letter-spacing="normal" style:text-scale="100%"
                                        style:letter-kerning="false" style:text-position="0% 100%"
                                        fo:font-size="10pt" style:font-size-asian="10pt"
                                        style:font-size-complex="10pt"
                                        fo:background-color="transparent"
                                        style:text-underline-type="none"
                                        style:text-underline-color="font-color"
                                        style:text-emphasize="none" fo:language="en" fo:country="GB"
                                        style:language-asian="en" style:country-asian="GB"
                                        style:language-complex="ar" style:country-complex="SA"
                                        style:text-combine="none" fo:hyphenate="true"/>
                                </style:default-style>

                                <style:style style:name="h1" style:display-name="h1"
                                    style:family="paragraph" style:parent-style-name="Normal"
                                    style:next-style-name="Normal" style:default-outline-level="1">
                                    <style:paragraph-properties fo:keep-with-next="always"
                                        fo:keep-together="always" fo:margin-top="0.3333in"
                                        fo:margin-bottom="0in"/>
                                    <style:text-properties style:font-name="Arial"
                                        style:font-name-asian="Times New Roman"
                                        style:font-name-complex="Times New Roman"
                                        fo:font-weight="bold" style:font-weight-asian="bold"
                                        style:font-weight-complex="bold" fo:color="#365F91"
                                        fo:font-size="18pt" style:font-size-asian="18pt"
                                        style:font-size-complex="18pt" fo:background-color="#0000ff"
                                        fo:hyphenate="false"/>
                                </style:style>

                                <style:style style:name="h2" style:display-name="h2"
                                    style:family="paragraph" style:parent-style-name="Normal"
                                    style:next-style-name="Normal" style:default-outline-level="1">
                                    <style:paragraph-properties fo:keep-with-next="always"
                                        fo:keep-together="always" fo:margin-top="0.3333in"
                                        fo:margin-bottom="0in"/>
                                    <style:text-properties style:font-name="Arial"
                                        style:font-name-asian="Times New Roman"
                                        style:font-name-complex="Times New Roman"
                                        fo:font-weight="bold" style:font-weight-asian="bold"
                                        style:font-weight-complex="bold" fo:color="#365F91"
                                        fo:font-size="18pt" style:font-size-asian="18pt"
                                        style:font-size-complex="18pt" fo:hyphenate="false"
                                        fo:background-color="#e5e5e5"/>
                                </style:style>

                                <style:style style:name="h3" style:display-name="h3"
                                    style:family="paragraph" style:parent-style-name="Normal"
                                    style:next-style-name="Normal" style:default-outline-level="1">
                                    <style:paragraph-properties fo:keep-with-next="always"
                                        fo:keep-together="always" fo:margin-top="0.3333in"
                                        fo:margin-bottom="0in"/>
                                    <style:text-properties style:font-name="Arial"
                                        style:font-name-asian="Times New Roman"
                                        style:font-name-complex="Times New Roman"
                                        fo:font-weight="bold" style:font-weight-asian="bold"
                                        style:font-weight-complex="bold" fo:color="#365F91"
                                        fo:font-size="16pt" style:font-size-asian="16pt"
                                        style:font-size-complex="16pt" fo:hyphenate="false"
                                        fo:background-color="#e5e5e5"/>
                                </style:style>

                                <style:style style:name="h4" style:display-name="h4"
                                    style:family="paragraph" style:parent-style-name="Normal"
                                    style:next-style-name="Normal" style:default-outline-level="1">
                                    <style:paragraph-properties fo:keep-with-next="always"
                                        fo:keep-together="always" fo:margin-top="0.3333in"
                                        fo:margin-bottom="0in"/>
                                    <style:text-properties style:font-name="Arial"
                                        style:font-name-asian="Times New Roman"
                                        style:font-name-complex="Times New Roman"
                                        fo:font-weight="bold" style:font-weight-asian="bold"
                                        style:font-weight-complex="bold" fo:color="#365F91"
                                        fo:font-size="14pt" style:font-size-asian="14pt"
                                        style:font-size-complex="14pt" fo:hyphenate="false"
                                        fo:background-color="#e5e5e5"/>
                                </style:style>

                                <style:style style:name="h5" style:display-name="h5"
                                    style:family="paragraph" style:parent-style-name="Normal"
                                    style:next-style-name="Normal" style:default-outline-level="1">
                                    <style:paragraph-properties fo:keep-with-next="always"
                                        fo:keep-together="always" fo:margin-top="0.3333in"
                                        fo:margin-bottom="0in"/>
                                    <style:text-properties style:font-name="Arial"
                                        style:font-name-asian="Times New Roman"
                                        style:font-name-complex="Times New Roman"
                                        fo:font-weight="bold" style:font-weight-asian="bold"
                                        style:font-weight-complex="bold" fo:color="#365F91"
                                        fo:font-size="12pt" style:font-size-asian="12pt"
                                        style:font-size-complex="12pt" fo:hyphenate="false"
                                        fo:background-color="#e5e5e5"/>
                                </style:style>

                                <style:style style:name="h6" style:display-name="h6"
                                    style:family="paragraph" style:parent-style-name="Normal"
                                    style:next-style-name="Normal" style:default-outline-level="1">
                                    <style:paragraph-properties fo:keep-with-next="always"
                                        fo:keep-together="always" fo:margin-top="0.3333in"
                                        fo:margin-bottom="0in"/>
                                    <style:text-properties style:font-name="Arial"
                                        style:font-name-asian="Times New Roman"
                                        style:font-name-complex="Times New Roman"
                                        fo:font-weight="bold" style:font-weight-asian="bold"
                                        style:font-weight-complex="bold" fo:color="#365F91"
                                        fo:font-size="10pt" style:font-size-asian="10pt"
                                        style:font-size-complex="10pt" fo:hyphenate="false"
                                        fo:background-color="#e5e5e5"/>
                                </style:style>

                                <style:style style:name="h7" style:display-name="h7"
                                    style:family="paragraph" style:parent-style-name="Normal"
                                    style:next-style-name="Normal" style:default-outline-level="1">
                                    <style:paragraph-properties fo:keep-with-next="always"
                                        fo:keep-together="always" fo:margin-top="0.3333in"
                                        fo:margin-bottom="0in"/>
                                    <style:text-properties style:font-name="Arial"
                                        style:font-name-asian="Times New Roman"
                                        style:font-name-complex="Times New Roman"
                                        fo:font-weight="bold" style:font-weight-asian="bold"
                                        style:font-weight-complex="bold" fo:color="#365F91"
                                        fo:font-size="10pt" style:font-size-asian="10pt"
                                        style:font-size-complex="10pt" fo:hyphenate="false"
                                        fo:background-color="#e5e5e5"/>
                                </style:style>

                                <style:style style:name="h8" style:display-name="h8"
                                    style:family="paragraph" style:parent-style-name="Normal"
                                    style:next-style-name="Normal" style:default-outline-level="1">
                                    <style:paragraph-properties fo:keep-with-next="always"
                                        fo:keep-together="always" fo:margin-top="0.3333in"
                                        fo:margin-bottom="0in"/>
                                    <style:text-properties style:font-name="Arial"
                                        style:font-name-asian="Times New Roman"
                                        style:font-name-complex="Times New Roman"
                                        fo:font-weight="bold" style:font-weight-asian="bold"
                                        style:font-weight-complex="bold" fo:color="#365F91"
                                        fo:font-size="10pt" style:font-size-asian="10pt"
                                        style:font-size-complex="10pt" fo:hyphenate="false"
                                        fo:background-color="#e5e5e5"/>
                                </style:style>

                                <style:style style:name="Normal" style:display-name="Normal"
                                    style:family="paragraph">
                                    <style:text-properties fo:hyphenate="false"/>
                                </style:style>

                                <!-- simple inline styles -->
                                <style:style style:name="italic"
                                    style:parent-style-name="DefaultParagraphFont"
                                    style:family="text">
                                    <style:text-properties fo:font-style="italic"
                                        style:font-style-asian="italic"/>
                                </style:style>
                                <style:style style:name="bold"
                                    style:parent-style-name="DefaultParagraphFont"
                                    style:family="text">
                                    <style:text-properties fo:font-weight="bold"
                                        style:font-weight-asian="bold"/>
                                </style:style>
                                <style:style style:name="sup"
                                    style:parent-style-name="DefaultParagraphFont"
                                    style:family="text">
                                    <style:text-properties style:text-position="super 63.6%"/>
                                </style:style>
                                <style:style style:name="sub"
                                    style:parent-style-name="DefaultParagraphFont"
                                    style:family="text">
                                    <style:text-properties style:text-position="sub 63.6%"/>
                                </style:style>
                                <style:style style:name="sc"
                                    style:parent-style-name="DefaultParagraphFont"
                                    style:family="text">
                                    <style:text-properties fo:font-variant="small-caps"/>
                                </style:style>


                                <style:style style:name="DefaultParagraphFont"
                                    style:display-name="Default Paragraph Font" style:family="text"/>

                                <!-- Lists styles -->
                                <style:style style:name="ListParagraph"
                                    style:display-name="List Paragraph" style:family="paragraph"
                                    style:parent-style-name="Normal">
                                    <style:paragraph-properties fo:margin-left="0.5in">
                                        <style:tab-stops/>
                                    </style:paragraph-properties>
                                    <style:text-properties fo:hyphenate="false"/>
                                </style:style>



                                <!-- for boxed text -->
                                <style:style style:name="boxed-para"
                                    style:parent-style-name="Normal" style:family="paragraph">
                                    <style:paragraph-properties fo:background-color="#FDE9D9"/>
                                </style:style>

                                <!-- for fig placeholders -->
                                <style:style style:name="fig-para" style:parent-style-name="Normal"
                                    style:family="paragraph">
                                    <style:paragraph-properties fo:background-color="#eeeeee"/>
                                </style:style>

                                <!-- disp quotes -->
                                <style:style style:name="disp-quote"
                                    style:parent-style-name="Normal" style:family="paragraph">
                                    <style:paragraph-properties fo:background-color="#eeeeee"/>
                                </style:style>

                                <!-- hyperlinks -->
                                <style:style style:name="Hyperlink" style:family="text"
                                    style:display-name="Hyperlink"
                                    style:parent-style-name="DefaultParagraphFont">

                                    <style:text-properties style:text-underline-type="single"
                                        fo:color="#0000FF" style:text-underline-mode="continuous"
                                        style:text-underline-width="auto"
                                        style:text-underline-style="solid"/>

                                </style:style>



                                <text:notes-configuration text:note-class="footnote"
                                    text:start-value="0" style:num-format="1"
                                    text:start-numbering-at="document"
                                    text:footnotes-position="page"/>
                                <text:notes-configuration text:note-class="endnote"
                                    text:start-value="0" style:num-format="i"
                                    text:start-numbering-at="document"
                                    text:footnotes-position="document"/>
                                <text:outline-style>
                                    <text:outline-level-style text:level="1" style:num-format=""/>
                                </text:outline-style>
                                <style:default-style style:family="graphic">
                                    <style:graphic-properties draw:fill="solid"
                                        draw:fill-color="#4f81bd" draw:opacity="100%"
                                        draw:stroke="solid" svg:stroke-width="0.02778in"
                                        svg:stroke-color="#385d8a" svg:stroke-opacity="100%"/>
                                </style:default-style>

                                <!-- Headers & Footers -->
                                <style:style style:name="Header" style:display-name="Header"
                                    style:family="paragraph" style:parent-style-name="Normal">
                                    <style:paragraph-properties fo:margin-bottom="0in"
                                        fo:line-height="100%">
                                        <style:tab-stops>
                                            <style:tab-stop style:type="center"
                                                style:position="3.134in"/>
                                            <style:tab-stop style:type="right"
                                                style:position="6.268in"/>
                                        </style:tab-stops>
                                    </style:paragraph-properties>
                                    <style:text-properties fo:hyphenate="false"/>
                                </style:style>
                                <style:style style:name="HeaderChar"
                                    style:display-name="Header Char" style:family="text"
                                    style:parent-style-name="DefaultParagraphFont"/>
                                <style:style style:name="Footer" style:display-name="Footer"
                                    style:family="paragraph" style:parent-style-name="Normal">
                                    <style:paragraph-properties fo:margin-bottom="0in"
                                        fo:line-height="100%">
                                        <style:tab-stops>
                                            <style:tab-stop style:type="center"
                                                style:position="3.134in"/>
                                            <style:tab-stop style:type="right"
                                                style:position="6.268in"/>
                                        </style:tab-stops>
                                    </style:paragraph-properties>
                                    <style:text-properties fo:hyphenate="false"/>
                                </style:style>
                                <style:style style:name="FooterChar"
                                    style:display-name="Footer Char" style:family="text"
                                    style:parent-style-name="DefaultParagraphFont"/>
                                <text:notes-configuration text:note-class="footnote"
                                    text:start-value="0" style:num-format="1"
                                    text:start-numbering-at="document"
                                    text:footnotes-position="page"/>
                                <text:notes-configuration text:note-class="endnote"
                                    text:start-value="0" style:num-format="i"
                                    text:start-numbering-at="document"
                                    text:footnotes-position="document"/>
                                <style:style style:family="graphic" style:name="Graphics"/>
                                <style:default-style style:family="graphic">
                                    <style:graphic-properties draw:fill="solid"
                                        draw:fill-color="#4f81bd" draw:opacity="100%"
                                        draw:stroke="solid" svg:stroke-width="0.02778in"
                                        svg:stroke-color="#385d8a" svg:stroke-opacity="100%"/>
                                </style:default-style>

                            </office:styles>

                            <!-- These must be automatic styles -->
                            <office:automatic-styles>

                                <!-- page spec -->
                                <style:page-layout style:name="PL0">
                                    <style:page-layout-properties fo:page-width="8.268in"
                                        fo:page-height="11.693in" style:print-orientation="portrait"
                                        fo:margin-top="0.4916in" fo:margin-left="1in"
                                        fo:margin-bottom="0.4916in" fo:margin-right="1in"
                                        style:num-format="1" style:writing-mode="lr-tb">
                                        <style:footnote-sep style:width="0.007in"
                                            style:rel-width="33%" style:color="#000000"
                                            style:line-style="solid" style:adjustment="left"/>
                                    </style:page-layout-properties>
                                    <style:header-style>
                                        <style:header-footer-properties style:dynamic-spacing="true"
                                            fo:min-height="0.5083in"/>
                                    </style:header-style>
                                    <style:footer-style>
                                        <style:header-footer-properties style:dynamic-spacing="true"
                                            fo:min-height="0.5083in"/>
                                    </style:footer-style>
                                </style:page-layout>

                                <style:style style:name="PNUM" style:family="paragraph"
                                    style:parent-style-name="Footer">

                                    <style:paragraph-properties fo:text-align="center"/>
                                </style:style>

                            </office:automatic-styles>

                            <office:master-styles>
                                <style:master-page style:name="MP0" style:page-layout-name="PL0">
                                    <style:header>
                                        <text:p text:style-name="Header"/>
                                    </style:header>
                                    <style:footer>
                                        <text:p text:style-name="PNUM">
                                            <text:page-number text:fixed="false"
                                                >1</text:page-number>
                                        </text:p>
                                        <text:p text:style-name="Footer"/>
                                    </style:footer>
                                </style:master-page>
                            </office:master-styles>

                        </office:document-styles>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>

    <p:store name="store-styles" standalone="true" omit-xml-declaration="false">
        <p:with-option name="href" select="concat($work-dir,'/out/styles.xml')"/>
    </p:store>

    <p:identity>
        <p:input port="source">
            <p:pipe step="store-styles" port="result"/>
        </p:input>
    </p:identity>

</p:pipeline>
