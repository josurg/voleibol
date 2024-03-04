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
					<td><xsl:value-of select="equipos/local" /> - <xsl:value-of select="equipos/visitante" /></td>
					<td><xsl:value-of select="fecha" /> </td>
					<xsl:choose>
						<xsl:when test="equipos/visitante/@puntuacion &gt; equipos/local/@puntuacion">
							<td class="azul"><xsl:value-of select="equipos/local/@puntuacion" /> - <xsl:value-of select="equipos/visitante/@puntuacion" /> </td>
						</xsl:when>
						<xsl:otherwise>
							<td><xsl:value-of select="equipos/local/@puntuacion" /> - <xsl:value-of select="equipos/visitante/@puntuacion" /> </td>
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