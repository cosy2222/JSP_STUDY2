<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB의 내용을 가져와서 출력 하기 </title>
</head>
<body>

<!--    
 	Statement :
 		- 단일로 한번만 실행할떄 빠른 속도를 가진다
 		- 쿼리에 인자를 부여할 수 없다     변수를 쿼리에 적용할떄 따옴표 처리를 잘해야 한다 
 		- 매번 컴파일을 수행해야 한다 	(cache를 사용하지 않는다 )
	
	PreparedStatement : 
		- 쿼리에 인자를 부여 할 수 없다				? 인자에 변수를 할당한다 
		- 처음 컴파일 된 이후 , 그 이후에는 수행하지 않는다 (cache를 사용한다)
		- 여러번 수행할떄 빠른 속도를 가진다 



 -->




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
			// Statement stmt = null;   // SQL 쿼리를 담아서 실행하는 객체
			PreparedStatement pstmt = null;
			
			
			try {
				String sql= "Select * from mbtbl";
				pstmt = conn.prepareStatement(sql); 		// preparedStatement 객체 생성시에 sql 쿼리를 넣는다 
				rs=  pstmt.executeQuery();
							// pstmt.executeQuery() : select한 결과를 ResultSet객체에 저쟁해야함
							// pstmt.executeUpdate() : insert , update , delete 
							
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
				if(pstmt != null)
					pstmt.close();
				if(conn!= null)
					conn.close();
			}
		
		
	
	
	
			%>
	
	</table>



</body>
</html>