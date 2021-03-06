<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" margin-right="1in"
                    margin-left="1in" margin-bottom="1in" margin-top="1in">
                    <fo:region-body   margin-top="1.0in"  margin-bottom="1.0in"
                        margin-left="0.5in" margin-right="0.5in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <xsl:call-template name="insert-svg"/>
                    <xsl:apply-templates/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
    <xsl:template name="insert-svg">
        <fo:block>
            <fo:instream-foreign-object>
                <xsl:copy-of select="document('xwing.svg')"/>
            </fo:instream-foreign-object>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="p">
        <fo:block>
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>
    
</xsl:transform>