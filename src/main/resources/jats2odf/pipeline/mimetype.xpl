<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:mimetype" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xo="http://xmlopen.org/xproc"
    version="1.0">

    <p:option name="work-dir" required="true"/>

    <p:store name="store-mimetype" method="text" encoding="UTF-8" indent="false">
        <p:with-option name="href" select="concat($work-dir,'/out/mimetype')"/>
        <p:input port="source">
            <p:inline><t>application/vnd.oasis.opendocument.text</t></p:inline>
        </p:input>
    </p:store>

    <p:identity>
        <p:input port="source">
            <p:pipe step="store-mimetype" port="result"/>
        </p:input>
    </p:identity>

</p:pipeline>
