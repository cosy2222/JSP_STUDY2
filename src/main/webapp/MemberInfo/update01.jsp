<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update를 통한 데이터 수정 </title>
</head>
<body>

	<%@ include file = "db_connection_oracle.jsp" %>
	
	
	<form method = "post" action = update01_process.jsp>  

	<p> 아이디: <input type = "text" name = "id">
	<p> 패스워드: <input type = "text" name = "passwd">
	<p> 이름: <input type = "text" name = "name">
	<p> 이메일: <input type = "text" name = "email">
	<p> <input type = "submit" values = "전송">
	
	</form>
	


</body>
</html>