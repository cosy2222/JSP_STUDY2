<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	// ���� �ʱ�ȭ
	Connection conn = null;	// DB�� �����ϴ� ��ü
	String driver = "oracle.jdbc.driver.OracleDriver";	// Oracle Driver�� �����ϴ� ����
	String url = "jdbc:oracle:thin:@localhost:1521:XE"; 	// Oracle Driver�� �����ϴ� ����
	Class.forName (driver);	// oracle driver loaded
	conn = DriverManager.getConnection (url, "hr", "hr");
	
%>


</body>
</html>