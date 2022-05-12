<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href = "filegb.css" rel = "stylesheet" type = "text/css">
<title>글 삭제  (실제 DB에서 삭제 )</title>
</head>
<body>
	<%@ include file = "db_connection_oracle.jsp" %>

	<a href = "freeboard_list.jsp?go=<%= request.getParameter("page")%>"> 게시판 목록으로 이동 </a>
	
	<%
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;			// delete가 잘되었는지 확인하는 변수 
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			sql = "select * from freeboard where id = ? " ;  // DB의 비밀번호와  form으로 넘겨온 비밀번호 확인
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			rs= pstmt.executeQuery();
			
			if(!(rs.next())){
				out.println("해당내용이 존재하지 않습니다");
			}else {
				// 존재하는 경우는 password를 확인후 맞으면 삭제
				String pwd = rs.getString("password");
				if (pwd.equals(request.getParameter("password"))){
					sql = "delete freeboard where id = ? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt (1,id);
					cnt = pstmt.executeUpdate();
					
					if (cnt >0){
						out.println("해당 내용이 삭제 되었습니다");
					}else{
						out.println("해당 내용이 삭제되지 않았습니다 ");
					}
				}else{
					out.println("비밀번호가 존재하지 않습니다");
				}
					
			}
			
			
		}catch(Exception e){
			out.println(e.getMessage());
		}finally{
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		
		
	
	
	%>


</body>
</html>