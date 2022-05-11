<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB�� ������ �����ͼ� ��� �ϱ� </title>
</head>
<body>

	<%@ include file = "db_connection_oracle.jsp" %>
	
	<table width = "300" border="1">
		<tr>
			<th> ���̵� </th> 
			<th> ��й�ȣ </th>
			 <th> �̸�  </th>
			 <th> email  </th>
			 <th> city  </th>
			 <th> phone  </th>
		</tr>
	
		<%
			ResultSet rs = null;    // Resultset ��ü�� DB�� ���̺��� Select�ؼ� ���� ��� ���ڵ���� ��� ��ü 
			Statement stmt = null;   // SQL ������ ��Ƽ� �����ϴ� ��ü 
			
			
			try {
				String sql= "Select * from mbtbl";
				stmt = conn.createStatement(); 		// connection ��ü�� conn.createStatement();�� stmt�� Ȱ��ȭ 
				rs=  stmt.executeQuery(sql);
							// stmt.executeQuery(sql) : select�� ����� ResultSet��ü�� �����ؾ���
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
				out.println("���̺� ȣ���ϴµ� ���� �߽��ϴ�");
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