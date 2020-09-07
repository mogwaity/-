<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
     pageEncoding="UTF-8"%>
 

 

 <%request.setCharacterEncoding("UTF-8"); %>
 <!-- 实例化javabean对象的Book类 -->
 <jsp:useBean id="books" class="com.hbsi.domain.Book"></jsp:useBean>
 <!-- 自动匹配同名称属性的元素 -->
 <jsp:setProperty property="*" name="books"/>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Insert title here</title>
 </head>
 <body>
 <%
     try{
    	 Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
         //out.print("加载数据库驱动成功！！！"+"<br/>");
         Connection conn=null;
         String url="jdbc:mysql://localhost:3306/bookstorebase?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
         String user="ty";
         String passw="mogwaity187"; //加载数据库驱动程序
         //获取数据库连接
         conn=DriverManager.getConnection(url,user,passw);
         //创建connection连接，
         //out.print("创建connection连接成功！！！"+"<br/>");
         String sql="insert into books(id,name,author,price,description) values(?,?,?,?,?)";
         
         //添加商品信息的sql语句
         PreparedStatement ps=conn.prepareStatement(sql);
         //获取PreparedStatement
         ps.setString(1,books.getId());//对sql语句中的第1个参数赋值
         ps.setString(2,books.getName());//对sql语句中的第2个参数赋值
         ps.setString(3,books.getAuthor());//对sql语句中的第3个参数赋值
         ps.setDouble(4,books.getPrice());//对sql语句中的第4个参数赋值
         ps.setString(5,books.getDescription());//对sql语句中的第5个参数赋值
         int row=ps.executeUpdate();//执行更新操作，返回所影响的行数
         if(row>0){
             out.print("成功添加了 "+row+" 条数据");
         }
         ps.close();
         conn.close();
     }catch(Exception e){
         out.print("商品信息添加失败！！！");
         e.printStackTrace();
     }

 %>    
 <br>
 <a href="${pageContext.request.contextPath}/ListBookServlet">查看商品信息</a>    
 
 </body>
 </html>