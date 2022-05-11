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
	// form 에서  request객체의 getparameter로  form에서 넘긴 변수의 값을 받는다
	request.setCharacterEncoding("EUC-KR");   // 한글 꺠지지 않도록 처리    EUC-KR , UTF-8
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;
	
	// 폼에서 념겨받은 id의 passwd를 DB에서 가져온 ID,PASSWD를 확인해서 같으면 update하고  다르면 update 하지 않는다 
	
	try{
		// 폼에서 넘겨받은 id를 조건으로 해서 DB의 값을 select 해온다 
		sql = "select id,pass from mbtbl where id = '" + id + "'";
		stmt = conn.createStatement();   // conn의 createStatement() 를 사용해서 stmt 객체를 활성화
		rs = stmt.executeQuery(sql);
				// stmt.executeUpdate  : insert , update , delete
				// stmt.executeQuer    : select 한 결과를  ResultSet 객체로 리턴
				
		if (rs.next()){   //DB에 form에서 넘긴 ID가 존재하면 ==> form 에서 넘긴 패스워드와 DB의 패스워드 일치 확인
			//out.println (id + " : 해당 아이디가 존재합니다 . ");
		
			// DB에서 값을 가지고 온 ID와 Password를 변수에 할당
			String rid = rs.getString("id");
			String rpassword = rs.getString("pass");
			
			// form에서 넘겨준 값과 DB에서 가져온 값이 일치 하는지 확인
			if (id.equals(rid) && passwd.equals(rpassword)){
				// DB에서 가져온 password와 form에서 넘긴 password가 일치할떄 update한다
				// sql변수 재사용
				sql = "update mbtbl set name ='" +  name + "', email = '" + email + "' where id = '"+id+"'";
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
				out.println("테이블의 내용이 수정 되었습니다");
				
			}else{  //패스워드가 일치하지 않을떄
				out.println("패스워드가 일치 하지 않습니다");
			}
			
			
		}else{		// DB에 form에서 넘긴 id가 존재하지 않을떄 
			out.println (id + " : 해당 id가 데이터 베이스에 존재하지 않습니다 ");
		}
		
		
		out.println(sql);
		
	}catch(Exception e){
		out.println(e.getMessage());
		out.println(sql);
	}finally{
		if ( rs != null)
			rs.close();
		if ( stmt != null)
			stmt.close();
		if ( conn != null)
			conn.close();
	}
	
	




%>	
	

</body>
</html>