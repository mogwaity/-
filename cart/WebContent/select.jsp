<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>查询商品信息</title>
 </head>
 <body>
     <form action="query.jsp" method="post" onsubmit="return check(this);">
         <table align="center" width="450">
             <tr>
                 <td align="right">商品ID：</td>
                 <td><input type="text" name="id"/></td>
             </tr>
             
             <tr>
                 <td align="center" colspan="2">
                     <input type="submit" value="查询">
                </td>
             </tr>
         </table>
     </form>
 </body>
 </html> 