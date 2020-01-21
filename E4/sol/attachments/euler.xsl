<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output indent="no" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <xsl:variable name="k" select="1000"/>
        <xsl:variable name="sum">
            <xsl:call-template name="sum-multiples">
                <xsl:with-param name="k" select="$k"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:value-of select="$sum"/>
    </xsl:template>

    <xsl:template name="sum-multiples">
        <xsl:param name="k"/>
        <xsl:param name="current" select="0"/>
        <xsl:param name="sum" select="0"/>

        <xsl:choose>
            <xsl:when test="$current &lt; $k">
                <xsl:variable name="new-sum" select="if ($current mod 3 = 0 or $current mod 5 = 0) then ($sum + $current) else $sum"/>
                <xsl:call-template name="sum-multiples">
                    <xsl:with-param name="k" select="$k"/>
                    <xsl:with-param name="current" select="$current+1"/>
                    <xsl:with-param name="sum" select="$new-sum"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="$sum"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:transform>
