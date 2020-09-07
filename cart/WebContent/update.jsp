<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("gb2312"); %>
 <!-- 实例化javabean对象的Book类 -->
 <jsp:useBean id="books" class="com.hbsi.domain.Book"></jsp:useBean>
 <!-- 自动匹配同名称属性的元素 -->
 <jsp:setProperty property="*" name="books"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

</head>

<body>
    <%request.setCharacterEncoding("gb2312"); %>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
   // out.print("加载数据库驱动成功！！！"+"<br/>");
    Connection conn=null;
    String url="jdbc:mysql://localhost:3306/bookstorebase?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
    String user="ty";
    String passw="mogwaity187"; //加载数据库驱动程序
    //获取数据库连接
    conn=DriverManager.getConnection(url,user,passw);

		String id = request.getParameter("id");
		String name="";
		String author="";
	    String price= "";
		String description= "";

		String sql = "select * from books where id=?";
		PreparedStatement pStmt = conn.prepareStatement(sql);
		pStmt.setString(1, id);
		ResultSet rs = pStmt.executeQuery();
		while (rs.next()) {
			name=rs.getString("name");
			author=rs.getString("author");
			price=rs.getString("price");
			description=rs.getString("description");
		}
	%>
	<form action="modify.jsp" method="post" onsubmit="return check(this);">
         <table align="center" width="450">
             <tr>
                 <td align="center" colspan="2">
                     <h2>修改商品信息</h2>
                     <hr>
                 </td>
             </tr>
             <tr>
                 <td align="right">商品ID：(不能修改)</td>
                 <td><input type="text" name="id" readonly="readonly" value="<%=id%>"/></td>
             </tr>
             <tr>
                 <td align="right">商品名称：</td>
                 <td><input type="text" name="name" value="<%=name%>"/></td>
             </tr>
             <tr>
                 <td align="right">商家：</td>
                 <td><input type="text" name="author" value="<%=author%>"/></td>
             </tr>
             <tr>
                <td align="right">价格：</td>
                 <td><input type="text" name="price" value="<%=price%>"/></td>
             </tr>
             <tr>
                 <td align="right">商品描述：</td>
                 <td><input type="text" name="description" value="<%=description%>"/></td>
             </tr>
             <tr>
                 <td align="center" colspan="2">
                     <input type="submit" value="修改">
                     <a href="delete.jsp?id=<%=id%>">删除</a>
                </td>
             </tr>
         </table>
     </form>
	
	<%
		//关闭
		pStmt.close();
		conn.close();

	%>

</body>
</html>