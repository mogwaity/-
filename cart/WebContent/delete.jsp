<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
     pageEncoding="UTF-8"%>
 

 

 <%request.setCharacterEncoding("UTF-8"); %>
 <!-- 实例化javabean对象的Book类 -->
 <jsp:useBean id="books" class="com.hbsi.domain.Book"></jsp:useBean>
 <!-- 自动匹配同名称属性的元素 -->
 <%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Insert title here</title>
 </head>
 <body>
 <%

   
    	 Class.forName("com.mysql.cj.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
        // out.print("加载数据库驱动成功！！！"+"<br/>");
         Connection conn=null;
         String url="jdbc:mysql://localhost:3306/bookstorebase?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
         String user="ty";
         String passw="mogwaity187"; //加载数据库驱动程序
         //获取数据库连接
         conn=DriverManager.getConnection(url,user,passw);
         //创建connection连接，
         //out.print("创建connection连接成功！！！"+"<br/>");

          String id=request.getParameter("id");
          String sql = "delete from books where id="+id+"";
		  PreparedStatement pst=conn.prepareStatement(sql);
		 
		  pst.executeUpdate();

		
		//关闭
		pst.close();
		conn.close();
		
	%>    
 <br>
 <a href="${pageContext.request.contextPath}/ListBookServlet">查看商品信息</a>    
 
 </body>
 </html>