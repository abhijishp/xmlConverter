<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:core" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:cxf="http://xmlcalabash.com/ns/extensions/fileutils"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:xo="http://xmlopen.org/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">

    <p:option name="work-dir" required="true"/>
    <p:option name="jats-doc-sysid" required="true"/>

    <p:import href="fileutils.xpl"/>
    <p:import href="core.xpl"/>
    
    <cxf:mkdir>
        <p:with-option name="href" select="$work-dir"/>
    </cxf:mkdir>

    <!-- load it! -->
    <p:load name="jats-source">
        <p:with-option name="href" select="$jats-doc-sysid"/>
    </p:load>

    <xo:core>
        <p:with-option name="work-dir" select="$work-dir"/>
    </xo:core>

</p:pipeline>
