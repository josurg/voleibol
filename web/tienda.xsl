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
			
			<main class="principal">

				<!-- Seleccionamos la tienda que queremos mostrar y aplicamos la plantilla -->
				<xsl:apply-templates select="tienda"/>
			</main>

			<footer>
				<address>&#169; Desarrollado por info@birt.eus</address>
			</footer>
		</body>
	</html>
</xsl:template>

<!-- Plantilla articulo. Damos formato a los articulos -->
<xsl:template match="articulo">
	<article>
		<section>
			
			<!-- Usamos las {} para combinar codigo HTML y XSLT. Mostramos la foto -->
			<img class="articulo" src="../img/{@foto}"/>			
		</section>
		<section>

			<!-- Mostramos el precio -->
			<h2><xsl:value-of select='precio'/> €</h2>

			<!-- Usamos la función count() para mostrar el número de comentarios -->
			<h3>Comentarios: <xsl:value-of select='count(comentarios)'/> </h3>
			<ul>
			
				<!-- Seleccionamos los comentarios -->
				<xsl:apply-templates select="comentarios"/>
			</ul>
		</section>
	</article>
</xsl:template>

<!-- Plantilla comentarios. Damos formato a los comentarios -->
<xsl:template match="comentarios">
	
	<!-- Mostramos los comentarios -->
	<li><xsl:value-of select='@fecha'/>: <xsl:value-of select='.'/> </li>
</xsl:template>

</xsl:stylesheet>