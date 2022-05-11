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
	
	<table width = "300" border="1">
		<tr>
			<th> eno </th> 
			<th> ename </th>
			 <th> job  </th>
			 <th> manager  </th>
			 <th> hiredate  </th>
			 <th> salary  </th>
			 <th> commission  </th>
			 <th> dno  </th>
		</tr>
	
		<%
			ResultSet rs = null;    // Resultset 객체는 DB의 테이블을 Select해서 나온 결과 레코드셋을 담는 객체 
			Statement stmt = null;   // SQL 쿼리를 담아서 실행하는 객체 
			
			
			try {
				String sql= "Select * from emp_copy";
				stmt = conn.createStatement(); 		// connection 객체의 conn.createStatement();로 stmt를 활성화 
				rs=  stmt.executeQuery(sql);
							// stmt.executeQuery(sql) : select한 결과를 ResultSet객체에 저쟁해야함
							// stmt.executeUpdate(sql) : insert , update , delete 
							
				while(rs.next()){
					String eno = rs.getString("eno");
					String ename = rs.getString("ename");
					String job = rs.getString("job");
					String manager = rs.getString("manager");
					String hiredate = rs.getString("hiredate");
					String salary = rs.getString("salary");
					String commission = rs.getString("commission");
					String dno = rs.getString("dno");
				
			%>	
							
				<tr>
					<td> <%= eno %> </td> 
					<td> <%= ename %> </td>
				 	<td> <%= job %>  </td>
				 	<td> <%= manager %>  </td>
				 	<td> <%= hiredate %>  </td>
				 	<td> <%= salary %>  </td>
				 	<td> <%= commission %>  </td>
				 	<td> <%= dno %>  </td>
				</tr>
				
				<% 
				}
				
			}catch (Exception ex){
				out.println("테이블 호출하는데 실해 했습니다");
				out.println(ex.getMessage());
				
			}finally{
				
			}
		
		
	
	
	
			%>
	
	</table>




</body>
</html>