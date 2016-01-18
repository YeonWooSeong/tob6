<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!doctype html>
<html lang="en">
<head>
   <meta charset="UTF-8" />
   
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=53e2827500534f733c75dadaccfdbaa2"></script>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="${js}/purchase.js"></script> 
<script src="${js}/cart.js"></script> 
<script src="${js}/Book.js"></script>
<script src="${js}/event.js"></script>
<script src="${js}/member.js"></script>
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
