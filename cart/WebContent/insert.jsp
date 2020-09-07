<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>添加商品信息</title>
 </head>
 <body>
     <form action="test.jsp" method="post" onsubmit="return check(this);">
         <table align="center" width="450">
             <tr>
                 <td align="center" colspan="2">
                     <h2>添加商品信息</h2>
                     <hr>
                 </td>
             </tr>
             <tr>
                 <td align="right">商品ID：</td>
                 <td><input type="text" name="id"/></td>
             </tr>
             <tr>
                 <td align="right">商品名称：</td>
                 <td><input type="text" name="name"/></td>
             </tr>
             <tr>
                 <td align="right">商家：</td>
                 <td><input type="text" name="author"/></td>
             </tr>
             <tr>
                <td align="right">价格：</td>
                 <td><input type="text" name="price"/></td>
             </tr>
             <tr>
                 <td align="right">商品描述：</td>
                 <td><input type="text" name="description"/></td>
             </tr>
             <tr>
                 <td align="center" colspan="2">
                     <input type="submit" value="添加">
                </td>
             </tr>
         </table>
     </form>
 </body>
 </html> 