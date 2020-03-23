<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
	String id = "";
	String title = "";
	String title1 = "";
	String content = "";
	String keyw = "";
	String author = "";
	boolean flag1=false;
	boolean flag2=false;
	boolean flag3=false;
	boolean flag4=false;
	boolean flag5=false;
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
    
    <title>My JSP 'savenews.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%
		request.setCharacterEncoding("utf-8");
		if(request.getParameter("id")!=null)     {
			flag1=true; id = request.getParameter("id");
		}
		if(request.getParameter("title")!=null)  {
			flag2=true; title = request.getParameter("title");
		}
		if(request.getParameter("body")!=null)   {
			flag3=true; content = request.getParameter("body");  
		}
		if(request.getParameter("keyw")!=null)    {
			flag4=true; keyw = request.getParameter("keyw");
		}
		if(request.getParameter("author")!=null)  {
			flag5=true; author = request.getParameter("author");
		}
		// 如果内容都不为空，则添加或修改记录
		if(flag1 & flag2 & flag3 & flag4 & flag5 ) {
			
            // 执行插入操作
            Connection con=null;
            PreparedStatement ps=null;
            Statement stmt=null;
         
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/jsp";
            String user="root";
            String pass="root";
            con=DriverManager.getConnection(url,user,pass);
            stmt=con.createStatement();
            
            String sql =  "update news set title='" + title ;
	               sql += "',content='" + content + "',keyw='" + keyw + "',author='";
	               sql += author + "' where id=" + id;
            ps=con.prepareStatement(sql);
            int n=ps.executeUpdate();
        
        
			out.println("<hr>");
			out.println("<h2>留言添加成功！</h2>");
			out.println("<hr>");
        }else {
			out.println("<hr>");
	        out.println("<h2>请输入正确的信息后再进行录入！</h2>");
			out.println("<hr>");
        }
%>
        <jsp:forward page="newsedit.jsp"/>
  </head>
</html>
