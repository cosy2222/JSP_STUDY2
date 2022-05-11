<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB의 내용을 가져와서 출력 하기 </title>
</head>
<body>

	<%@ include file = "db_connection_oracle.jsp" %>
	
	<table width = "300" border="1">
		<tr>
			<th> 아이디 </th> 
			<th> 비밀번호 </th>
			 <th> 이름  </th>
			 <th> email  </th>
			 <th> city  </th>
			 <th> phone  </th>
		</tr>
	
		<%
			ResultSet rs = null;    // Resultset 객체는 DB의 테이블을 Select해서 나온 결과 레코드셋을 담는 객체 
			Statement stmt = null;   // SQL 쿼리를 담아서 실행하는 객체 
			
			
			try {
				String sql= "Select * from mbtbl";
				stmt = conn.createStatement(); 		// connection 객체의 conn.createStatement();로 stmt를 활성화 
				rs=  stmt.executeQuery(sql);
							// stmt.executeQuery(sql) : select한 결과를 ResultSet객체에 저쟁해야함
							// stmt.executeUpdate(sql) : insert , update , delete 
							
				while(rs.next()){
					String id = rs.getString("id");
					String name = rs.getString("name");
					String pass = rs.getString("pass");
					String email = rs.getString("email");
					String city = rs.getString("city");
					String phone = rs.getString("phone");
				
			%>	
							
				<tr>
					<td> <%= id %> </td> 
					<td> <%= pass %> </td>
				 	<td> <%= name %>  </td>
				 	<td> <%= email %>  </td>
				 	<td> <%= city %>  </td>
				 	<td> <%= phone %>  </td>
				</tr>
				
				<% 
				}
				
			}catch (Exception ex){
				out.println("테이블 호출하는데 실해 했습니다");
				out.println(ex.getMessage());
				
			}finally{
				if(stmt != null)
					stmt.close();
				if(conn!= null)
					conn.close();
			}
		
		
	
	
	
			%>
	
	</table>



</body>
</html>