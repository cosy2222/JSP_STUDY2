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
		
		PreparedStatement pstmt = null;
		String sql = null;
		try{
			sql = "insert into emp_copy(eno,ename,job,manager,hiredate,salary,commission,dno) values(?,?,?,?,to_date(?,'yyyymmdd'),?,?,?)";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, eno);
			pstmt.setString(2, ename);
			pstmt.setString(3, job);
			pstmt.setString(4, manager);
			pstmt.setString(5, hiredate);
			pstmt.setString(6, salary);
			pstmt.setString(7, commission);
			pstmt.setString(8, dno);
			pstmt.executeUpdate();
			out.println("테이블 삽입에 성공했습니다.");
				
		}catch(Exception e){
			out.println("emp_copy 테이블에 데이터 삽입을 하지 못하였습니다");
			out.println(sql);
		}
	
	
	
	%>

</body>
</html>