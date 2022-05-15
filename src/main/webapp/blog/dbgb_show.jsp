<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file = "db_connection_oracle.jsp" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<%
	Vector name=new Vector();		
	Vector email=new Vector();
	Vector inputdate=new Vector();
	Vector subject=new Vector();
	Vector content=new Vector();
	
	
	
	 int where=1;

	  int totalgroup=0;		
	  int maxpages=3;  
	  int startpage=1;		
	  int endpage=startpage+maxpages-1;		
	  int wheregroup=1;			
	  
	  
	  
	  if (request.getParameter("go") != null) {			
		   where = Integer.parseInt(request.getParameter("go"));    
		   wheregroup = (where-1)/maxpages + 1;			
		   startpage=(wheregroup-1) * maxpages+1;  
		   endpage=startpage+maxpages-1; 
		   
		  } else if (request.getParameter("gogroup") != null) {	 
		   wheregroup = Integer.parseInt(request.getParameter("gogroup"));
		   startpage=(wheregroup-1) * maxpages+1;  
		   where = startpage ; 
		   endpage=startpage+maxpages-1; 
		  }
		  int nextgroup=wheregroup+1;    
		  int priorgroup= wheregroup-1;		 

		  int nextpage=where+1;      
		  int priorpage = where-1;	 
		  int startrow=0;    
		  int endrow=0;		
		  int maxrows=2;      
		  int totalrows=0;		
		  int totalpages=0;		
	
	
 		  String em = null;	
		  String sql = null;
		  Statement stm =null;
		  ResultSet rs =null;
		
			
		  try{
			  stm = conn.createStatement();
			  sql = "select * from guestboard order by inputdate";
			  rs = stm.executeQuery(sql);
			  
			  if(!(rs.next())){
				  out.println("게시판에 글이 없습니다 ");
			  }else{
				  do {
				    	name.addElement(rs.getString("name"));
					    email.addElement(rs.getString("email"));
					    inputdate.addElement(rs.getString("inputdate"));
					    subject.addElement(rs.getString("subject"));
					    content.addElement(rs.getString("content"));
				   }while(rs.next());
					   totalrows = name.size();      
					   totalpages = (totalrows-1)/maxrows +1;
					   startrow = (where-1) * maxrows;     
					   endrow = startrow+maxrows-1  ;		 
				  
				  
				   if (endrow >= totalrows)
					    endrow=totalrows-1;
					  
				   totalgroup = (totalpages-1)/maxpages +1;
				  
				   if (endpage > totalpages) 
					    endpage=totalpages;
				  
				  
				   
				   
				   for(int j=startrow;j<=endrow;j++){
					   
					   em = "<A href=mailto:" + email.elementAt(j) + ">" + email.elementAt(j) + "</A>";
					   
					   out.println("<table width='600' cellspacing='0' cellpadding='2' align='center'>");
					   out.println("<tr>");
					   out.println("<td height='22'>&nbsp;</td></tr>");
					   out.println("<tr align='center'>");
					   out.println("<td height='1' bgcolor='#1F4F8F'></td>");
					   out.println("</tr>");
					   out.println("<tr align='center' bgcolor='#DFEDFF'>");
					   out.println("<td class='button' bgcolor='#DFEDFF'>"); 
					   out.println("<div align='left'><font size='2'>"+subject.elementAt(j) + "</div> </td>");
					   out.println("</tr>");
					   out.println("<tr align='center' bgcolor='#FFFFFF'>");
					   out.println("<td align='center' bgcolor='#F4F4F4'>"); 
					   out.println("<table width='100%' border='0' cellpadding='0' cellspacing='4' height='1'>");
					   out.println("<tr bgcolor='#F4F4F4'>");
					   out.println("<td width='13%' height='7'></td>");
					   out.println("<td width='51%' height='7'>글쓴이 : "+ name.elementAt(j) +"</td>");
					   out.println("<td width='11%' height='7'>" +  em   +"</td>");
					   out.println("<td width='25%' height='7'></td>");
					   out.println("</tr>");
					   out.println("<tr bgcolor='#F4F4F4'>");
					   out.println("<td width='13%'></td>");
					   out.println("<td width='51%'>작성일 : " + inputdate.elementAt(j) + "</td>");
					   out.println("<td width='11%'></td>");
					   out.println("</tr>");
					   out.println("</table>");
					   out.println("</td>");
					   out.println("</tr>");
					   out.println("<tr align='center'>");
					   out.println("<td bgcolor='#1F4F8F' height='1'></td>");
					   out.println("</tr>");
					   out.println("<tr align='center'>");
					   out.println("<td style='padding:10 0 0 0'>");
					   out.println("<div align='left'><br>");
					   out.println("<font size='3' color='#333333'><PRE>"+content.elementAt(j) + "</PRE></div>");
					   out.println("<br>");
					   out.println("</td>");
					   out.println("</tr>");
					   out.println("<tr align='center'>");
					   out.println("<td class='button' height='1'></td>");
					   out.println("</tr>");
					   out.println("<tr align='center'>");
					   out.println("<td bgcolor='#1F4F8F' height='1'></td>");
					   out.println("</tr>");
					   out.println("</table>");
					   
				   }
			   
			   
			  }   
			  
			  if (wheregroup > 1) {     
				  out.println("[<a href=dbgb_show.jsp?gogroup=1>처음</a>]"); 
				  out.println("[<a href=dbgb_show.jsp?gogroup="+priorgroup +">이전</a>]");
			    }else {		
				  out.println("[처음]") ;
				  out.println("[이전]") ;
			    }
			  
			  if (name.size() !=0) { 
			  	for(int jj=startpage; jj<=endpage; jj++) {
			   		if (jj==where) 
			    		out.println("["+jj+"]") ;
			   		else
			    		out.println("[<a href=dbgb_show.jsp?go="+jj+">" + jj + "</a>]") ;
			    } 
			  }
			  
			  
			  if (wheregroup < totalgroup) {
			   out.println("[<a href=dbgb_show.jsp?gogroup="+ nextgroup+ ">다음</a>]");
			   out.println("[<a href=dbgb_show.jsp?gogroup="+ totalgroup + ">마지막</a>]");
			  } else {
			   out.println("[다음]");
			   out.println("[마지막]");
			  }
			  out.println("<p>");
			  out.println("<a href='dbgb_write.htm'><img src='image/write.gif' border='0'></a>");
	 			  	
			  
		  }catch(Exception e ){
			  out.println(e);
		  }finally{
				if(rs != null)
					rs.close();
				if(stm != null)
					stm.close();
				if(conn != null)
					conn.close();
		  }
	

%>


</body>
</html>