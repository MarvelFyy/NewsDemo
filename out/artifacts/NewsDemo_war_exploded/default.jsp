<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
	String sql = "";
	int totalRecords = 1;
	ResultSet rs = null;
	ResultSet rsTmp = null;
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>留言展示表</title>
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="style.css">
	-->
	<Script language="JavaScript">
        //打开新窗口函数NewsWindow
		function NewsWindow(id)
		{
		      window.open('newswind.jsp?id='+id,'infoWin', 'height=400,width=600,scrollbars=yes,resizable=yes');
		}
    </Script>
</head>
 
<body>
<%

         Class.forName("com.mysql.jdbc.Driver");
         String url="jdbc:mysql://localhost:3306/jsp";
         String user="root";
         String pass="root";
         Connection conn=DriverManager.getConnection(url,user,pass);
         Statement stmt=conn.createStatement();   
         ResultSet rsTmp = stmt.executeQuery("select count(id) as countid from news");

         rsTmp.next();
         totalRecords = rsTmp.getInt("countid");
         rsTmp.close();
         
         ResultSet rs = stmt.executeQuery("SELECT * from news order by ID desc");                 

	     if(!rs.next()) {
		     out.println("<p>还 没 有 任 何 留言</p>");
	     }else{
%>
	     <p><strong>全部留言</strong></p>
	     <table width=100%>
	         <tr bgcolor=cccccc align=center>
	             <td>标题</td>
	             <td>作者</td>
	             <td>日期</td>
	         </tr>
<%
	         int cc = 1;
	         do {
			     // 不同行之间以不同颜色显示
		    	 if(cc % 2 == 1)
					  out.println("<tr bgcolor=#E7E7E7>");
				 else
					  out.println("<tr BGCOLOR=#F4F4F4>");
%>
		 	     <td align=center><a href="javascript:NewsWindow(<%=rs.getInt("ID")%>)"><u><%=rs.getString("title")%></u></a></td>
			     <td align=center><%=rs.getString("author")%></td>
			     <td align=center><%=rs.getDate("times").toString()%>
<%
			     out.println("</td></tr>");
			     cc++;
	         } while(rs.next());
	         out.println("</table><p>共" + totalRecords + "条留言");
         }
         rs.close();
%>
        <p align=center><a href="newsedit.jsp">编辑留言</a></p>
</body>
