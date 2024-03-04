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
				<!-- Seleccionamos los equipos a los que queremos aplicar la plantilla -->
				<xsl:apply-templates select="equipo/entrenador"/>
				<!-- 
				<h1><a href="https://es.wikipedia.org/wiki/Julio_Velasco">JULIO VELASCO</a></h1>
				-->
				<!-- <article class="equipos">
					<xsl:apply-templates select="jugadores/jugador"/>
					<h4>Club VolleyTeam</h4>
					<p>7 - Luis García</p>
					<p>12 - Silvia Ramos</p>
				</article> -->
			</main>

			<footer>
				<address>&#169; Desarrollado por info@birt.eus</address>
			</footer>
		</body>
	</html>
</xsl:template>



<xsl:template match="entrenador">
	<xsl:variable name="ent" select="nombre"/>
	<!-- <h1><a href="{url}"><xsl:value-of select="nombre"/></a></h1> -->
	
	<xsl:if test="nombre='Julio Velasco'">
		<!-- Usamos las {} para combinar codigo HTML y XSLT -->
		<h1><a href="{url}"><xsl:value-of select="$ent"/></a></h1>
		
		<article class="equipos">
			<h4><xsl:value-of select="$ent/../../nombre"/></h4>
			<xsl:apply-templates select="../jugadores/jugador"/>
		</article>
    </xsl:if>   
</xsl:template>

<xsl:template match="jugador">
	<!-- <xsl:choose>
		<xsl:when test="@titular='si'">
			<p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
		</xsl:when>
	</xsl:choose> -->

	<xsl:if test="@titular='si'">
		<p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
    </xsl:if> 
</xsl:template>

<!-- <xsl:template match="entrenador">
	<xsl:variable name="ent" select="equipo"/>
	<h1><a href={entrenador/url} <xsl:value-of select="entrenador[nombre=$ent]"/>JULIO VELASCO</a></h1>
</xsl:template>
-->

</xsl:stylesheet>