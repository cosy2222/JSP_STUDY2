<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file = "db_connection_oracle.jsp" %> 
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String eno = request.getParameter("eno");
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		String manager = request.getParameter("manager");
		String hiredate = request.getParameter("hiredate");
		String salary = request.getParameter("salary");
		String commission = request.getParameter("commission");
		String dno = request.getParameter("dno");
		
		Statement stmt = null;
		String sql = null;
		try{
			sql = "insert into emp_copy(eno,ename,job,manager,hiredate,salary,commission,dno) values("+ eno +",'"+ ename + "','" + job + "'," + manager + ","+"to_date (" + hiredate + ", 'yyyymmdd')"+ ","  + salary+"," + commission+"," + dno + ")";
			stmt = conn.createStatement(); 
			stmt.executeUpdate(sql);	
				
			out.println("테이블 삽입에 성공했습니다.");
				
		}catch(Exception e){
			out.println("emp_copy 테이블에 데이터 삽입을 하지 못하였습니다");
			out.println(sql);
		}
	
	
	
	%>

</body>
</html>