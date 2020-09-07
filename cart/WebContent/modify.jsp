<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
     pageEncoding="UTF-8"%>
 
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
 <%request.setCharacterEncoding("UTF-8");%>
    <jsp:useBean id="books" class="com.hbsi.domain.Book">
    <jsp:setProperty name="books" property="*"/>
    </jsp:useBean>
 <%

	 Class.forName("com.mysql.cj.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
     out.print("加载数据库驱动成功！！！"+"<br/>");
     Connection conn=null;
     String url="jdbc:mysql://localhost:3306/bookstorebase?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
     String user="ty";
     String passw="mogwaity187"; //加载数据库驱动程序
     //获取数据库连接
     conn=DriverManager.getConnection(url,user,passw);
     //创建connection连接，
     //out.print("创建connection连接成功！！！"+"<br/>");
        String id=request.getParameter("id");
        String sql="update books set name=?,author=?,price=?,description=? where id="+id+"";
        String name=new String((request.getParameter("name")).getBytes("ISO-8859-1"),"utf8");
        String author=new String((request.getParameter("author")).getBytes("ISO-8859-1"),"utf8");
        //String name=new String((request.getParameter("name")).getBytes("ISO-8859-1"),"utf8");
        String description=new String((request.getParameter("description")).getBytes("ISO-8859-1"),"utf8");
       // String name = request.getParameter("name");
	   // String author = request.getParameter("author");
	    //double price=Double.parseDouble(request.getParameter("price"));     
	    //String description = request.getParameter("description");
         //添加图书信息的sql语句
         PreparedStatement ps=conn.prepareStatement(sql);
         //获取PreparedStatement
         ps.setString(1,books.getName());//对sql语句中的第2个参数赋值
         ps.setString(2,books.getAuthor());//对sql语句中的第3个参数赋值
         ps.setDouble(3,books.getPrice());//对sql语句中的第4个参数赋值
         ps.setString(4,books.getDescription());//对sql语句中的第5个参数赋值
       int row=ps.executeUpdate();//执行更新操作，返回所影响的行数
     if(row>0){
         out.print("成功修改了 "+row+" 条数据！！！");
     }
     ps.close();
     conn.close();

 %>    
 <br>
 <a href="${pageContext.request.contextPath}/ListBookServlet">查看商品信息</a>    
 
 </body>
 </html>