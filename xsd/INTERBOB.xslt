<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="doc" select="'INTERBOB_glossary.xml'" />
	
	<xsl:template match="/">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
			<link rel="stylesheet" type="text/css" href="INTERBOB.css"/>
		</head>
		<body>
			<h1 style="margin-top:0;margin-bottom:21px">INTERBOB</h1>
			<table class="width100" cellspacing="1">
				<tr>
					<th>Nom</th>
					<th>Description</th>
					<th>Utilisation</th>
					<th>Valeur</th>
				</tr>
				<xsl:variable name="root" select="name(/*)"/>
				<xsl:for-each select="//*">
					<xsl:variable name="parent" select="name(..)"/>
					<xsl:variable name="element" select="name()"/>
					<tr>
						<xsl:choose>
							<xsl:when test="count(.//*) &gt; 0">
								<xsl:choose>
									<xsl:when test="$parent != ''">
										<td class="category"><xsl:copy-of select="$parent"/>:<xsl:value-of select="$element"/></td>
										<td class="category"><xsl:copy-of select="document($doc)//element[(@name=$element and @parent=$parent and @parent!='' and @root=$root and @root!='') or (@name=$element and @parent=$parent and @parent!='' and @root='') or (@root='' and @parent='' and @name=$element)]/desc"/></td>
										<td class="category"><xsl:copy-of select="document($doc)//element[(@name=$element and @parent=$parent and @parent!='' and @root=$root and @root!='') or (@name=$element and @parent=$parent and @parent!='' and @root='') or (@root='' and @parent='' and @name=$element)]/usage"/></td>
										<td class="category" />
									</xsl:when>
									<xsl:otherwise>
										<td class="category"><xsl:value-of select="$element"/></td>
										<td class="category"><xsl:copy-of select="document($doc)//element[(@name=$element and @parent=$parent and @parent!='' and @root=$root and @root!='') or (@name=$element and @parent=$parent and @parent!='' and @root='') or (@root='' and @parent='' and @name=$element)]/desc"/></td>
										<td class="category"><xsl:copy-of select="document($doc)//element[(@name=$element and @parent=$parent and @parent!='' and @root=$root and @root!='') or (@name=$element and @parent=$parent and @parent!='' and @root='') or (@root='' and @parent='' and @name=$element)]/usage"/></td>
										<td class="category" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<td><xsl:copy-of select="$parent"/>:<b><xsl:value-of select="$element"/></b></td>
								<td><xsl:copy-of select="document($doc)//element[(@name=$element and @parent=$parent and @parent!='' and @root=$root and @root!='') or (@name=$element and @parent=$parent and @parent!='' and @root='') or (@root='' and @parent='' and @name=$element)]/desc"/></td>
								<td><xsl:copy-of select="document($doc)//element[(@name=$element and @parent=$parent and @parent!='' and @root=$root and @root!='') or (@name=$element and @parent=$parent and @parent!='' and @root='') or (@root='' and @parent='' and @name=$element)]/usage"/></td>
								<td><xsl:value-of select="current()"/></td>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
					<xsl:for-each select="@*">
					<tr>
						<xsl:variable name="attr" select="name()"/>
						<td><xsl:copy-of select="$element"/>:<b><xsl:value-of select="$attr"/></b><br/><i>Attribut</i></td>
						<td><xsl:copy-of select="document($doc)//element[(@name=$attr and @parent=$element and @parent!='' and @root=$root and @root!='') or (@name=$attr and @parent=$element and @parent!='' and @root='') or (@name=$attr and @parent='' and @root='')]/desc"/></td>
						<td><xsl:copy-of select="document($doc)//element[(@name=$attr and @parent=$element and @parent!='' and @root=$root and @root!='') or (@name=$attr and @parent=$element and @parent!='' and @root='') or (@name=$attr and @parent='' and @root='')]/usage"/></td>
						<td><xsl:value-of select="current()"/></td>
					</tr>
					</xsl:for-each>
				</xsl:for-each>
			</table>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>