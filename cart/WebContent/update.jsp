<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("gb2312"); %>
 <!-- ʵ����javabean�����Book�� -->
 <jsp:useBean id="books" class="com.hbsi.domain.Book"></jsp:useBean>
 <!-- �Զ�ƥ��ͬ�������Ե�Ԫ�� -->
 <jsp:setProperty property="*" name="books"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

</head>

<body>
    <%request.setCharacterEncoding("gb2312"); %>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");//�������ݿ�������ע�ᵽ����������
   // out.print("�������ݿ������ɹ�������"+"<br/>");
    Connection conn=null;
    String url="jdbc:mysql://localhost:3306/bookstorebase?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
    String user="ty";
    String passw="mogwaity187"; //�������ݿ���������
    //��ȡ���ݿ�����
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
                     <h2>�޸���Ʒ��Ϣ</h2>
                     <hr>
                 </td>
             </tr>
             <tr>
                 <td align="right">��ƷID��(�����޸�)</td>
                 <td><input type="text" name="id" readonly="readonly" value="<%=id%>"/></td>
             </tr>
             <tr>
                 <td align="right">��Ʒ���ƣ�</td>
                 <td><input type="text" name="name" value="<%=name%>"/></td>
             </tr>
             <tr>
                 <td align="right">�̼ң�</td>
                 <td><input type="text" name="author" value="<%=author%>"/></td>
             </tr>
             <tr>
                <td align="right">�۸�</td>
                 <td><input type="text" name="price" value="<%=price%>"/></td>
             </tr>
             <tr>
                 <td align="right">��Ʒ������</td>
                 <td><input type="text" name="description" value="<%=description%>"/></td>
             </tr>
             <tr>
                 <td align="center" colspan="2">
                     <input type="submit" value="�޸�">
                     <a href="delete.jsp?id=<%=id%>">ɾ��</a>
                </td>
             </tr>
         </table>
     </form>
	
	<%
		//�ر�
		pStmt.close();
		conn.close();

	%>

</body>
</html>