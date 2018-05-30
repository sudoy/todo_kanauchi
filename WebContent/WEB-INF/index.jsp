<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<jsp:include page="header.jsp" />

<jsp:include page="pop-up.jsp" />

<table class="table">
	<tr>
		<th>#</th>
		<th>題名</th>
		<th>重要度</th>
		<th>期限</th>
	</tr>
<% 
request.setCharacterEncoding("utf-8");
Connection con = null;
PreparedStatement ps = null;
String sql = null;
ResultSet rs = null;

try {
	//データベースの接続を取得
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/mysql");
		con = ds.getConnection();
		
	sql = "select  * from todo;";
	//select命令の準備
	ps = con.prepareStatement(sql);

	//select命令を実行
	rs = ps.executeQuery();
	
	while ( rs.next()){
%>

	<tr>
		<td><%=rs.getString("id") %></td>
		<td><a href="update.html"><%=rs.getString("title") %></a></td>
		<td><%=rs.getString("star") %></td>
		<td><%=rs.getString("deadline") %></td>
	</tr>

<%		
	    }			
	
} catch (Exception e) {
	throw new ServletException(e);
} finally {
	try {
		if (rs != null) {rs.close();}
		if (ps != null) {ps.close();}
		if (con != null) {con.close();}
	} catch (Exception e) {}
}

%>

</table>

<div class="form-group">
	<a href="entry.html" class="btn btn-primary"><span class="glyphicon glyphicon" aria-hidden="true"></span>追加</a>
</div>

<jsp:include page="footer.jsp" />