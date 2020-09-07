<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
      
      
    <title>您的购物显示页面</title>  
    <script type="text/javascript">  
        function deleteItem(id){  
        var  b = window.confirm("确定要删除吗？");  
           if(b){  
                window.location.href="${pageContext.request.contextPath}/DeleteItemServlet?id="+id;             
           }  
        }  
        function clearcart(){  
        var  b = window.confirm("确定要清空您当前所选的商品吗？");  
           if(b){  
                window.location.href="${pageContext.request.contextPath}/ClearCartServlet";             
           }  
        }  
    function changequantity(input,id,oldvalue){  
           //得到修改的数量  
          var quantity = input.value;  
            
          //判断是否是正整数  
          if(quantity<0 || quantity!=parseInt(quantity)){  
                 alert("请输入正整数！！");  
                 input.value=oldvalue;  
                 return;  
          }  
           var  b = window.confirm("确定要将数量修改为："+quantity);  
           if(b){  
                window.location.href="${pageContext.request.contextPath}/ChangeQuantityServlet?id="+id+"&quantity="+quantity;             
           }  
         
       }  
      
    </script>  
      
      
  
  </head>  
    
  <body >  
  <div style="text-align:center">
  <h1> 您的购物车</h1>  
    <h2>您购买了如下商品</h2>  
    <c:if test="${empty cart.map}">  
 <font color="red">您的购物车还是空的哦！！</font><br/>  
  
   
    您可以  
    <a href="${pageContext.request.contextPath}/ListBookServlet">点击此处进入购买页面</a>  
    </c:if>  
    <c:if test="${!empty cart.map}">  
      <table border="1" width="80%" bordercolor="blue">  
        <tr>  
           <td>编号</td>  
           <td>商品名</td>  
           <td>单价</td>  
           <td>数量</td>  
           <td>小计</td>  
           <td>操作</td>     
        </tr>  
        <c:forEach var="me" items="${cart.map}">  
          <tr>  
          <td>${me.key}</td>  
           <td>${me.value.book.name}</td>  
           <td>${me.value.book.price}￥</td>  
           <td>  
          <input type="text" name="quantity" value="${me.value.quantity}" onchange="changequantity(this,${me.key},${me.value.quantity})"/>  
             数量
           </td>  
           <td>${me.value.price}￥</td>  
             
           <td>  
             <a href="javascript:deleteItem(${me.key})" >删除</a>  
                <!--  <a href="javascript:void(0)" onclick="deleteItem(${me.key })">删除</a> -->
               <!--  <a href="${pageContext.request.contextPath}/DeleteItemServlet?id=${me.key}">删除</a>   -->
             
           </td>     
            
          </tr>  
          
        </c:forEach>  
        <tr>  
            <td colspan="3">总价</td>  
            <td colspan="1">${cart.price }￥</td>  
            <td>  
                  <!--<a href="${pageContext.request.contextPath}/ClearCartServlet">清空购物车</a>-->  
                <a href="javascript:clearcart()">清空购物车</a>    
        </tr>  
  
      </table>  
      <a href="${pageContext.request.contextPath}/ListBookServlet">返回继续购物</a>  
      
       </c:if>  
       </div>
  </body>  
</html>  