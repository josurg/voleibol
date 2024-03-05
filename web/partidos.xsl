<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
<xsl:template match='/club_voleibol'>

<!--
Autor: JESUS ANGEL RUIZ GONZALEZ
Asignatura: LMGSI
Unidad: UD 4
Fecha: 05-03-2024
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
			<h1>PARTIDOS</h1>
			<table>
				<tr>
					<th>PARTIDO</th>
					<th>FECHA</th>
					<th>RESULTADO</th>
				</tr>

				<!-- Seleccionamos los partidos jugados en Lima -->
				<xsl:for-each select="partido[lugar/@ciudad='Lima']">
        
        		<!-- Las ordenamos por fecha de más reciente a menos -->
				<xsl:sort select="fecha" order="descending" />
        		
				<tr>
					<!-- Mostramos los equipos local y visitante y la fecha del partido -->
					<td><xsl:value-of select="equipos/local" /> - <xsl:value-of select="equipos/visitante" /></td>
					<td><xsl:value-of select="fecha" /> </td>
					
					<!-- En el choose seleccionamos quién gana el partido -->
					<xsl:choose>

						<!-- Si gana el visitante mostramos el resultado en azul mediante la clase -->
						<xsl:when test="equipos/visitante/@puntuacion &gt; equipos/local/@puntuacion">
							<td class="azul"><xsl:value-of select="equipos/local/@puntuacion" /> - 
							<xsl:value-of select="equipos/visitante/@puntuacion" /> </td>
						</xsl:when>

						<!-- Si gana el local mostramos el resultado normal -->
						<xsl:otherwise>
							<td><xsl:value-of select="equipos/local/@puntuacion" /> - 
							<xsl:value-of select="equipos/visitante/@puntuacion" /> </td>
						</xsl:otherwise>
					</xsl:choose>
				</tr>
				</xsl:for-each>
			</table>			
		</main>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>