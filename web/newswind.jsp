<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
	String id = "";
	String sql = "";
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

</head>
  
<%
	         id = request.getParameter("id");
	
	         Class.forName("com.mysql.jdbc.Driver");
	         String url="jdbc:mysql://localhost:3306/jsp";
	         String user="root";
	         String pass="root";
	         Connection conn=DriverManager.getConnection(url,user,pass);
	         Statement stmt=conn.createStatement();
	         ResultSet rs=stmt.executeQuery("SELECT * from news where ID=" + id);
	
	         if(!rs.next()) {
		          out.println("错误的ID号");
		          rs.close();
		     }else{
%>
			 <table width="100%" HEIGHT=60% >
					  <tr bgcolor="#FAD195"> 
						  <td height=20 align=center><b><%=rs.getString("title")%></b></td>
					  </tr>
					  <tr> 
						  <td valign=center><p><%=rs.getString("content")%>
					  </tr>
		     </table>
		     <br><b>相关留言：</b>
			 <ul>
<%
 
		          sql="SELECT * from news where ID<>"+id+" and keyw='" + rs.getString("keyw")+"' order by ID desc";
		          rs.close();
		          rs = stmt.executeQuery(sql);
		          while(rs.next()) {
%>
		              <li><a href=newswind.jsp?id=<%=rs.getInt("ID")%>><u>
		              <%=rs.getString("title")%></u></a>--
			          <%=rs.getString("author")%>
			                                 【<%=rs.getDate("times").toString()%>】
<%
		          }
	              rs.close();
            }
%>
            </ul>
</html>
