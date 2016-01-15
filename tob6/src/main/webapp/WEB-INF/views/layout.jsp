<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!doctype html>
<html lang="en">

	
<head>
   <meta charset="UTF-8" />
      <title>TOB</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
   	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cardio: Free One Page Template by Luka Cvetinovic</title>
	<meta name="description" content="Cardio is a free one page template made exclusively for Codrops by Luka Cvetinovic" />
	<meta name="keywords" content="html template, css, free, one page, gym, fitness, web design" />
	<meta name="author" content="Luka Cvetinovic for Codrops" />
<!-- Favicons (created with http://realfavicongenerator.net/)-->
	<link rel="apple-touch-icon" sizes="57x57" href="${normal}/img2/favicons/apple-touch-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="${normal}/img2/favicons/apple-touch-icon-60x60.png">
	<link rel="icon" type="image/png" href="${normal}/img2/favicons/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="${normal}/img2/favicons/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="${normal}/img2/favicons/manifest.json">
	<link rel="shortcut icon" href="${normal}/img2/favicons/favicon.ico">
	<meta name="msapplication-TileColor" content="#00a8ff">
	<meta name="msapplication-config" content="img/favicons/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">    
	
	<link rel="stylesheet" type="text/css" href="${normal}/css2/normalize.css">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="${normal}/css2/bootstrap.css">
	<!-- Owl -->
	<link rel="stylesheet" type="text/css" href="${normal}/css2/owl.css">
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="${normal}/css2/animate.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="${normal}/fonts2/font-awesome-4.1.0/css/font-awesome.min.css">
	<!-- Elegant Icons -->
	<link rel="stylesheet" type="text/css" href="${normal}/fonts2/eleganticons/et-icons.css">
	<!-- Main style -->
	<link rel="stylesheet" type="text/css" href="${normal}/css2/cardio.css">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<section class="sectionClass">
				<div class="mainView">
					<tiles:insertAttribute name="content" />
				</div>
			</section>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
<script src="${js}/purchase.js"></script> 
<script src="${js}/cart.js"></script> 
<script src="${js}/Book.js"></script>
<script src="${js}/event.js"></script>
<script src="${js}/member.js"></script>
<!-- Scripts -->
	<script src="${normal}/js2/jquery-1.11.1.min.js"></script>
	<script src="${normal}/js2/owl.carousel.min.js"></script>
	<script src="${normal}/js2/bootstrap.min.js"></script>
	<script src="${normal}/js2/wow.min.js"></script>
	<script src="${normal}/js2/typewriter.js"></script>
	<script src="${normal}/js2/jquery.onepagenav.js"></script>
	<script src="${normal}/js2/main.js"></script>
   <!-- Normalize -->
<script>
var context = '${context}';
var img = '${img}';
var js = '${js}';
var css = '${css}';
var fonts = '${fonts}';
var startimages = '${startimages}';
var startcss = '${startcss}';
var startjs = '${startjs}';
</script>
</body>
</html>
