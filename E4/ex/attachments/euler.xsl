<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output indent="no" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <!--$k stores the value up to which multiples should be summed.-->
        <xsl:variable name="k" select="1000"/>
        
        <!--$multiples stores the result of invoking the named template.-->
        <xsl:variable name="sum">
            <xsl:call-template name="sum-multiples">
                <xsl:with-param name="k" select="$k"/>
            </xsl:call-template>
        </xsl:variable>
        
        <!--Writing the final result to an output document.-->
        <xsl:value-of select="$sum"/>
    </xsl:template>
    
    <xsl:template name="sum-multiples">
        <!--Your code here-->
    </xsl:template>
    
</xsl:transform>