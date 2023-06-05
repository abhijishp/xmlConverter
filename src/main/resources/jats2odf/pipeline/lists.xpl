<?xml version="1.0" encoding="UTF-8"?>
<p:pipeline type="xo:lists" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
    xmlns:xo="http://xmlopen.org/xproc" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    version="1.0">
    
    <!-- the list container becomes a text:list -->
    <p:rename match="list" new-name="text:list"/>
    
<!--    <p:add-attribute match="text:list" attribute-name="text:continue-numbering"
        attribute-value="true"/>
    -->
    
    <p:add-attribute match="text:list[@list-type='bullet']" attribute-name="text:style-name"
        attribute-value="L1"/>
    
    <p:rename match="list-item" new-name="text:list-item"/>
    <p:delete match="text:p[parent::text:list-item]/@text:style-name"/>
    <p:add-attribute match="text:p[parent::text:list-item]" attribute-name="text:style-name"
        attribute-value="P2"/>
    
    <!-- to make valid -->
    <p:unwrap match="text:p[text:list]"/>
    
    <!-- tidy up dangling JATS -->
    <p:delete match="text:list/@list-type"/>
   
    
</p:pipeline>
