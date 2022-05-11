
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert01_process.jsp</title>
</head>
<body>

<%@ include file = "db_connection_oracle.jsp" %>  <!--dbconn_oracle.jsp   파일의 코드를 그대로 내포 -->

<%  
	request.setCharacterEncoding("UTF-8"); // 폼에서 넘긴 한글을 처리하기 위한 구문
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("pass");
	String name = request.getParameter("name"); 
	String email = request.getParameter("email");
	
	PreparedStatement pstmt = null; // Statement 객체: SQL 쿼리 구문을 담아서 실행하는 객체 
	
	try{
		String sql = "insert into mbTbl(idx, id, pass, name, email) values(seq_mbTbl_idx.nextval, ?,?,?,?)";
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		pstmt.setString(4,email);
		pstmt.executeUpdate();	
			
		out.println("테이블 삽입에 성공했습니다.");
			
	}catch(Exception e){
		out.println("mbTbl 테이블에 데이터 삽입을 하지 못하였습니다. SDFG");
	}finally{
		
	}
%>

ID: <%= id %> <p>
PASSWORD: <%= passwd %> <p>
NAME: <%= name %> <p>
E-MAIL: <%= email %>





</body>
</html>