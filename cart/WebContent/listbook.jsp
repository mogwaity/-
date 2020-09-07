<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@  page import="java.sql.*,com.hbsi.utils.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
      
    <title>商品页</title>  
  </head>  
    
  <body style="background:url(images/list.jpg)" >  
  <%request.setCharacterEncoding("UTF-8"); %>
  <div style=" height:1000px;border-bottom-style:dashed;text-align:center; border-bottom-color:#00C; width:842px;">
    <h2>商品页</h2>
      
      <table border="1">  
        <tr>  
           <td border="1" width="126px">编号</td>  
           <td border="1" width="226px">商品名称</td>  
           <td border="1" width="64px">商家</td>  
           <td border="1" width="45px">价格</td>  
           <td border="1" width="250px">描述</td>  
           <td border="1" width="95px">操作</td>     
        </tr>  
        <form action="/ListBookServlet" method="get" name="postform">
        <table border=1 >
        
        <c:forEach var="books" items="${requestScope.books}">  
          <tr>  
          <td border="1" width="126px">${books.id}</td>  
           <td border="1" width="226px">${books.name}</td>  
           <td border="1" width="64px">${books.author}</td>  
           <td border="1" width="45px">${books.price}</td>  
           <td border="1" width="250px">${books.description}</td>  
           <td border="1" width="95px">  
               <a href="${pageContext.request.contextPath}/BuyServlet?id=${books.id}">加入购物车</a>  
               <a href="update.jsp?id=${books.id}">编辑</a> 
              <a href="delete.jsp?id=${books.id}">删除</a>
             
           </td>     
            
          </tr>  
          
        </c:forEach>  
          
        
        
      </table> 
       <a href="insert.jsp">添加商品</a> 
       <a href="select.jsp">查询商品</a>  
      </div>
  </body>  
</html>  
  