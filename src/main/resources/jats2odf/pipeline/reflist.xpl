<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:reflist" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
    xmlns:xo="http://xmlopen.org/xproc" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    version="1.0">
    
    <p:rename match="*[parent::ref]" new-name="p"/>
    <p:unwrap match="ref|ref-list"/>
    

</p:pipeline>