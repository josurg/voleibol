<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
<xsl:template match='/club_voleibol'>

<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main>
			<xsl:apply-templates select="equipo">

			</xsl:apply-templates>
			<article class="equipos">
				<xsl:apply-templates select="entrenador"/>
				<!--
				<h4><xsl:value-of select="equipo[/entrenador/nombre='Julio Velasco']/nombre"/></h4>
				-->
				<xsl:apply-templates select="jugadores"/>
			</article>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<xsl:template match="equipo">

	<xsl:variable name="ent" select="/equipo"/>
	<h1><a href={entrenador/url} <xsl:value-of select="/entrenador[nombre=$ent]"/>JULIO VELASCO</a></h1>
</xsl:template>

<xsl:template match="entrenador">
	<h4><xsl:value-of select="equipo[entrenador/nombre='Julio Velasco']/nombre"/></h4>
</xsl:template>

<xsl:template match="jugadores/jugador[@titular='si']">
	<p><xsl:value-of select='@camiseta'/> - <xsl:value-of select='nombre'/></p>
</xsl:template>

<xsl:template match="jugadores/jugador[@titular='no']">
</xsl:template>

</xsl:stylesheet>