<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns="http://www.w3.org/1999/xhtml">
  
	<xsl:output method="html"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes" encoding="utf-8"
		omit-xml-declaration="no" />

  <xsl:strip-space elements="*"/>
  
  <xsl:template match="/">
  	<html>
	  	<head>
				<style>
					table, th, td {
	    				border: 1px solid black;
	    				border-collapse: collapse;
					}
					table {
						width:50%;
					}
				</style>
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
  </xsl:template>
  
  <xsl:template match="whiskies">
  	<table>
  		<thead align="center">
  			<tr>
	  			<xsl:for-each select="whisky[1]/@*|whisky[1]/*">
	  				<td>
	  					<xsl:value-of select="name()"/>
	  				</td>
	  			</xsl:for-each>
  			</tr>
  		</thead>
  		<xsl:apply-templates/>
  	</table>
 	</xsl:template>
 	
 	<xsl:template match="whisky">
 		<tr>
 			<xsl:apply-templates select="@*"/>
 			<xsl:apply-templates select="distillery"/>
 			<xsl:apply-templates select="bottling"/>
 			<xsl:apply-templates select="age"/>
 			<xsl:apply-templates select="abv"/>
 		</tr>
 	</xsl:template>
 	
 	<xsl:template match="whisky/@*|whisky/*">
 		<td>
 			<xsl:value-of select="."/>
 		</td>
 	</xsl:template> 

</xsl:stylesheet>