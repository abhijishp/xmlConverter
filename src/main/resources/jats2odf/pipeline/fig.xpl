<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:fig" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
    xmlns:xo="http://xmlopen.org/xproc" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    version="1.0">

    <p:unwrap match="caption"/>

    <!-- boxed-text -->
    <p:add-attribute match="text:p[ancestor::fig]" attribute-name="text:style-name"
        attribute-value="fig-para"/>
    <p:unwrap match="fig"/>

   <!-- <p:replace match="graphic">
        <p:input port="replacement">
            <p:inline>
                <foo>
                    <text:p/>
                    <text:p/>
                    <text:p/>
                    <text:p/>
                </foo>
            </p:inline>
        </p:input>
    </p:replace>
    <p:unwrap name="foo"/>-->
</p:pipeline>
