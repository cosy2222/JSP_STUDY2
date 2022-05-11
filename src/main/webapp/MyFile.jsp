<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>오늘은 JSP 첫번쨰날 입니다</h3> <br> <br>
		
		<%@ page import = "java.util.Date" %>
		
		오늘의 날짜는 <%=new Date() %>



</body>
</html>