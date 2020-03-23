<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
	String sql = "";
	int id = 1;
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
    <base href="<%=basePath%>">
  
    <title>My JSP 'newsedit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="JavaScript">
		function NewsWindow(id)
		{
			window.open('newswind.jsp?id='+id,'infoWin', 'height=400,width=600,scrollbars=yes,resizable=yes');
		}
	</script>
  </head>
  <body>
<%
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/jsp";
            String user="root";
            String pass="root";
            Connection conn=DriverManager.getConnection(url,user,pass);
            Statement stmt=conn.createStatement();
            
            
            if(request.getParameter("del")!=null) {
                String sql="delete from news where id=" + request.getParameter("del"); 
                PreparedStatement  ps=conn.prepareStatement(sql);
                int rs=ps.executeUpdate();
            }
            sql="SELECT * from news order by ID desc";
            ResultSet rs=stmt.executeQuery(sql);
            if(!rs.next())
%>
    <p><strong>全部留言</strong>
    <table width=100%>
<%
	        do{
		        id = rs.getInt("ID");
%>
			<tr>
			  <td><a href="javascript:NewsWindow(<%=id%>)"><u>
			      <%=rs.getString("title")%></u></a>
			      <%=rs.getString("author")%>
			                   【<%=rs.getDate("times").toString()%>】
			  </td>
			  <td align=right>
			      <img src=images/TWO2_06.GIF><a href=newsedit2.jsp?id=<%=id%>>编辑</a>　
			      <img src=images/TWO2_09.GIF><a href=newsedit.jsp?del=<%=id%>>删除</a>
			  </td>
		    </tr>
		    
<%
	        }while(rs.next());
            rs.close();
%>
    </table>
    <p align=center><a href=newsadd.jsp>添加留言</a>　
                     <a href="default.jsp">查看留言</a>
    </p>
  </body>
</html>
