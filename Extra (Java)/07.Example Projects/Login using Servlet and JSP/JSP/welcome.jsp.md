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
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // for http 1.1		
			response.setHeader("Pragma", "no-cache"); // for http 1.0	
			response.setHeader("Expires", "0"); // for proxies
		
			if (session.getAttribute("username") == null){
				response.sendRedirect("login.jsp");
			}
		%>
			Welcome, ${username} !
			<br>
			
		<a href="videos.jsp">Videos here</a>
		
		<form action="../LogoutServlet">
			<input type="submit" value="Log out">
		</form>
	
	</body>
	</html>