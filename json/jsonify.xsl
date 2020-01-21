<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns="http://www.w3.org/1999/xhtml">
  
	<xsl:output method="text"/>

  <xsl:strip-space elements="*"/>
  
  <xsl:template match="/">{<xsl:apply-templates select="*" />}
</xsl:template>

  <xsl:template match="*">"<xsl:value-of select="name(.)" />":{<xsl:apply-templates select="*|@*" />},</xsl:template>
  
  <xsl:template match="*[not(following-sibling::*)]">"<xsl:value-of select="name(.)" />":{<xsl:apply-templates />}</xsl:template>
  
  <xsl:template match="//*[not(child::*)]">"<xsl:value-of select="name(.)" />":<xsl:apply-templates />,</xsl:template>
  
  <xsl:template match="//*[not(child::*) and not(following-sibling::*)]">"<xsl:value-of select="name(.)" />":<xsl:apply-templates /></xsl:template>
  
  <xsl:template match="text()">"<xsl:value-of select="." />"</xsl:template>
  
  <xsl:template match="@*"></xsl:template>

</xsl:stylesheet>