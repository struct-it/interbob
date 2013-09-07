<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="doc" select="'INTERBOB_doc.xml'" />
	
	<xsl:template match="/">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
			<link rel="stylesheet" type="text/css" href="default.css"/>
		</head>
		<body>
			<h1 style="margin-top:0;margin-bottom:21px">InterBOB</h1>
			<table class="width100" cellspacing="1">
				<tr>
					<th>Nom</th>
					<th>Description</th>
					<th>Utilisation</th>
					<th>Valeur</th>
				</tr>
				<xsl:for-each select="//*">
					<tr>
						<xsl:choose>
							<xsl:when test="count(.//*) &gt; 0">
								<td class="category" colspan="4"><xsl:value-of select="name()"/></td>
							</xsl:when>
							<xsl:otherwise>
								<td><xsl:copy-of select="name(..)"/>:<b><xsl:value-of select="name()"/></b></td>
								<xsl:variable name="element" select="name()"/>
								<td><xsl:copy-of select="document($doc)//element[@name=$element]/desc"/></td>
								<td><xsl:copy-of select="document($doc)//element[@name=$element]/usage"/></td>
								<td><xsl:value-of select="current()"/></td>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
				</xsl:for-each>
			</table>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>