	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		
		<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	// for http 1.1
			response.setHeader("Pragma", "no-cache"); // for http 1.0
			response.setHeader("Expires", "0"); // for proxies
			
			HttpSession ses = request.getSession();
			
			if (ses.getAttribute("username") == null){
				response.sendRedirect("login.jsp");
			}
		%>
		
	
			<iframe width="560" height="315" src="https://www.youtube.com/embed/OuBUUkQfBYM?si=h3v4-EvE4S6T2CSH" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
	</body>
	</html>