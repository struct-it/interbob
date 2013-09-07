<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="IdOperation_Besoin">
	?
	</xsl:variable>
	<xsl:variable name="IdOperation_Desc">
		Obligatoire s'il s'agit d'une vente pour télédistribution ou rechargement en différé, et que l'IdProduit n\'est pas déterminé au moment de la vente.<br/>
		Renseigné avec le numéro de la commande ou de l'élément de commande, ou de la demande de télédistribution en cas de vente pour télédistribution (cf. [3-A]) lorsque l'IdProduit n'est déterminé qu'au chargement.<br/>
		Optionnel (facultatif) s'il ne s'agit pas d'une vente pour télédistribution.
	</xsl:variable>

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
					<th>Name</th>
					<th>Description</th>
					<th>M/O</th>
					<th>Value</th>
				</tr>
				<xsl:for-each select="//*">
					<tr>
						<xsl:choose>
							<xsl:when test="count(.//*) &gt; 0">
								<td class="category"><xsl:value-of select="name()"/></td>
							</xsl:when>
							<xsl:otherwise>
								<td><xsl:value-of select="name()"/></td>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="name()='IdOperation'">
								<td><xsl:copy-of select="$IdOperation_Desc"/></td>
								<td><xsl:copy-of select="$IdOperation_Besoin"/></td>
							</xsl:when>
							<xsl:otherwise>
								<td/>
								<td/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="count(.//*) &gt; 0">
								<td/>
							</xsl:when>
							<xsl:otherwise>
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