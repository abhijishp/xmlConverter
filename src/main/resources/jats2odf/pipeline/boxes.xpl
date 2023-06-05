<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:boxes" xmlns:p="http://www.w3.org/ns/xproc" xmlns:xo="http://xmlopen.org/xproc"
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" version="1.0">

    <!-- boxed-text -->
    <p:add-attribute match="text:p[ancestor::boxed-text]" attribute-name="text:style-name"
        attribute-value="boxed-para"/>
    <p:unwrap match="boxed-text"/>

    <!-- disp-quote -->
    <p:add-attribute match="text:p[ancestor::disp-quote]" attribute-name="text:style-name"
        attribute-value="disp-quote"/>
    <p:unwrap match="disp-quote"/>


</p:pipeline>
