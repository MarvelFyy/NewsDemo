<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
	String id = "";
	String title = "";
	String title1 = "";
	String content = "";
	String keyw = "";
	String author = "";
	int currid = 0;
	String sql = "";
	ResultSet rs = null;
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'newsedit2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%
    // 下面主要是为了进行显示
    if(request.getParameter("id") != null) {
	     id = request.getParameter("id");
         Class.forName("com.mysql.jdbc.Driver");
         String url="jdbc:mysql://localhost:3306/jsp";
         String user="root";
         String pass="root";
         Connection conn=DriverManager.getConnection(url,user,pass);
         Statement stmt=conn.createStatement();
	
	     sql="select * from news where id=" + request.getParameter("id");
         ResultSet rs=stmt.executeQuery( sql );
		 if(rs.next()) {
			  title1  = rs.getString("title");
			  content = rs.getString("content");
			  keyw    = rs.getString("keyw");
			  author  = rs.getString("author");
			  rs.close();
%>

  </head>
  
		 <form name=form1 method="post" action="savenews.jsp">
		    <input value="<%=id%>" type=hidden name=id>
		    <P align="center">标　题：<INPUT size=95 name=title value=<%=title1%>></P>
		    <P align="center">内　容：<TEXTAREA cols=73 name=body rows=15><%=content%></TEXTAREA></P>
		    <P align="center">关键字：<INPUT size=25 name=keyw value=<%=keyw%>>
		　                                                                        作者：     <INPUT size=25 name=author value=<%=author%>></P>　
		    <p align="center"><INPUT class=buttonface type=submit value=" 确 定 ">
		                      <INPUT class=buttonface type=reset value=" 清 除 "></p>
		 </form>
<%
		 } else {
		    out.println("<hr>");	
			out.println("<center>非法的id号！</center>");
			out.println("<hr>");	
		 }
    }
%>
    <P align="right"><a href="newsedit.jsp">编辑留言</a>　<a href="default.jsp">查看留言</a></P>
    
</html>
