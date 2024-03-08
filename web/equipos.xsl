<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
<xsl:template match='/club_voleibol'>

<!--
Autor: JESUS ANGEL RUIZ GONZALEZ
Asignatura: LMGSI
Unidad: UD 4
Fecha: 08-03-2024
Tarea: Tarea evaluativa 2 (60%) - XSLT
Autoevaluación: https://docs.google.com/document/d/1QluGJQj9RsO75LrS7uN1xmU2amOpX6qGsNiVjG-waBg/edit?usp=sharing

Enlace a sitio web público: https://josurg.github.io/voleibol/index.html
-->

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
				
				<!-- Seleccionamos los entrenadores y aplicamos la plantilla -->
				<xsl:apply-templates select="equipo/entrenador"/>
			</main>

			<footer>
				<address>&#169; Desarrollado por info@birt.eus</address>
			</footer>
		</body>
	</html>
</xsl:template>

<!-- Seleccionamos el entrenador que queremos mostrar y aplicamos la plantilla -->
<xsl:template match="entrenador">
	
	<!-- Declaramos la variable ent para el nombre del entrenador -->
	<xsl:variable name="ent" select="nombre"/>
	
	<!-- En el if seleccionamos lo que queremos en base al valor de la variable -->
	<xsl:if test="nombre='Julio Velasco'">
		
		<!-- Usamos las {} para combinar codigo HTML y XSLT con la url de la web -->
		<h1><a href="{url}"><xsl:value-of select="$ent"/></a></h1>
		
		<article class="equipos">
			
			<!-- Mostramos el nombre del equipo en base al valor de la variable	-->
			<h4><xsl:value-of select="$ent/../../nombre"/></h4>
			
			<!-- Seleccionamos los jugadores con atributo titular 'si' -->
			<xsl:apply-templates select="../jugadores/jugador[@titular='si']"/>
		</article>
    </xsl:if>   
</xsl:template>

<!-- Seleccionamos el jugador que queremos mostrar y aplicamos la plantilla -->
<xsl:template match="jugador">
		
		<!-- Mostramos el número de la camiseta y el nombre del jugador -->
		<p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
</xsl:template>

</xsl:stylesheet>