	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<form action="../LoginServlet" method="GET">
			Enter username: <input type="text" name="username"><br>
			Enter password: <input type="password" name="pass"><br>
			<input type="submit" value="Login">
		</form>
	</body>
	</html>