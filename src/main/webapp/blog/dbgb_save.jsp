<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.* , java.util.* , java.text.*" %>
    <% request.setCharacterEncoding("EUC-KR"); %> 
    <%@ include file = "db_connection_oracle.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("content");
	
	
	
	int pos = 0;
	if (cont.length() ==1){
		cont = cont +" ";
	}
	
	while ((pos = cont.indexOf("\'" , pos)) != -1){
		String left = cont.substring(0,pos);
		String right = cont.substring(pos, cont.length());
		cont = left + "\'" + right;
		pos += 2;
	}
	
	
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-mm-d h:mm a");
	String ymd = myformat.format(yymmdd);
	
	String sql = null;
	Statement st = null;
	
	try{
		
		
		sql = "insert into guestboard (name , email , inputdate , subject , content) " ;
		sql = sql + "values ('" + na + "','" + em + "','" + ymd + "','" + sub + "','" +  cont + "')";
		st = conn.createStatement();
		st.executeUpdate(sql);
		
		out.println(sql);
		
		
		
	}catch(Exception  e){
		out.println(e.getMessage());
	}finally{
		if (conn != null)
			conn.close();
		if ( st != null )
			st.close();
	}
	
%>



<jsp:forward page="dbgb_show.jsp"/>





</body>
</html>