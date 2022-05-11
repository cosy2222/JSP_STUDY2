<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.* , java.util.* , java.text.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>   <!-- 한글 처리  -->
<%@ include file = "db_connection_oracle.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼의 값을 받아서 DataBase에 값을 넣어주는 파일 </title>
</head>
<body>

<%
	// 폼에서 넘긴 변수를 받아서 저장 
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("content");
	String pw = request.getParameter("password");
	
	int id = 1;			// DB에 id컬럼에 저장할 값
	
	int pos = 0;
	if (cont.length() ==1){
		cont = cont +" ";
	}
	
	// content (Text Area) 에 엔터를 처리해줘야 한다 
	while ((pos = cont.indexOf("\'" , pos)) != -1){
		String left = cont.substring(0,pos);
		String right = cont.substring(pos, cont.length());
		cont = left + "\'" + right;
		pos += 2;
	}
	
	//오늘의 날짜 처리 하는 함수 
	
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-mm-d h:mm a");
	String ymd = myformat.format(yymmdd);
	
	String sql = null;
	Statement st = null;
	ResultSet rs = null;
	int cnt = 0;				// insert 가 잘되었는지 확인하는 변수 
	
	try{
		
		// 값을 저장하기 전에 최신 글번호(max(id)를 가져와서 +1을 적용한다
		// conn   : Auto commit 이 작동된다
		st = conn.createStatement();
		sql = "select max(id) from freeboard";
		rs = st.executeQuery(sql);
		
		if(!(rs.next())){	// rs의 값이 비어있을때 
			id = 1;
		}else{				// rs의 값이 존재할때 
			id = rs.getInt(1) + 1; // 최대값 +1
		}
		
		
		sql = "insert into freeboard (id , name , password , email , subject, ";
		sql = sql + "content , inputdate , masterid , readcount , replaynum , step)";
		sql = sql + " values (" + id + ",'" + na + "' , '" + pw + "','" + em  ;
		sql = sql + "','" + sub + "','" + cont + "','" + ymd + "'," + id + ",";
		sql = sql + "0,0,0)";
		
		//out.println(sql);
		
		cnt = st.executeUpdate(sql);  // cnt > 0 : insert 성공 
		
		if ( cnt > 0){
			out.println("데이터가 성공적으로 입력 되었습니다");
		}else{
			out.println("데이터가 입력되지 않았습니다");
		}
		
		
		
		
		
	}catch(Exception  e){
		out.println(e.getMessage());
	}finally{
		if (rs != null)
			rs.close();
		if (conn != null)
			conn.close();
		if ( st != null )
			st.close();
	}
	
%>


<jsp:forward page="freeboard_list.jsp"/>











</body>
</html>