<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file = "db_connection_oracle.jsp" %>
	
	<%
		String eno = request.getParameter("eno");
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		String manager = request.getParameter("manager");
		String hiredate = request.getParameter("hiredate");
		String salary = request.getParameter("salary");
		String commission = request.getParameter("commission");
		String dno = request.getParameter("dno");
		
		Statement stmt = null ;
		ResultSet rs = null ;
		String sql = null ;
	
		try{
			sql = "select eno from emp_copy where eno = " + eno;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()){
				
				String reno = rs.getString("eno");
				
				if(eno.equals(reno)){
					sql = "delete emp_copy where eno = " + eno;
					stmt = conn.createStatement();
					stmt.executeUpdate(sql);
					
					out.println(eno + "사원의 정보가 삭제 되었습니다 ");
				}
				
			}else{
				out.print("존재하지않는 사원번호 입니다 ");
			}
			
		}catch(Exception e){
			
		}finally{
			if(stmt != null)
				stmt.close();
			if(rs != null)
				rs.close();
			if(conn != null)
				conn.close();
		}
		
	%>





</body>
</html>