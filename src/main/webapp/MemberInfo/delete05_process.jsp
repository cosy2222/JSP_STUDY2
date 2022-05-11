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
	request.setCharacterEncoding("EUC-KR");   // 한글 꺠지지 않도록 처리    EUC-KR , UTF-8
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		// 레코드 삭제 , form에서 넘긴 id,passwd 와 DB의 id와 passwd가 일치할떄  레코드 제거 
		sql = "select id , pass from mbtbl where id = ? ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		pstmt.setString(1, id);
		
		if(rs.next()){  // id가 존재할떄
			// rs의 결과 레코드를 변수에 할당
			String rid = rs.getString("id");
			String rpass = rs.getString("pass");
			
			//패스워드가 일치하는지 확인
			if (passwd.equals(rpass)){   // 폼의 password 와 DB의 password가 일치할떄
				sql= "delete mbtbl where id = ? ";
				pstmt.executeUpdate();
				pstmt.setString(1, id);
				
			}else{	 // 폼의 password 와 DB의 password가 일치하지 않을떄
				out.println("패스워드가 일치 하지 않습니다");
			}
			
			
		}else{		// id가 존재하지 않을떄
			out.println("해당 id가 존재하지 않습니다");
		}
		
		
		
		
		
		
	}catch(Exception e){
		out.println(e.getMessage());
	}finally{
		if ( rs != null)
			rs.close();
		if ( pstmt != null)
			pstmt.close();
		if ( conn != null)
			conn.close();
	}
	
	

	%>


</body>
</html>