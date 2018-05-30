<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
%>

<jsp:include page="header.jsp" />

<jsp:include page="pop-up.jsp" />

<table class="table">
	<tr>
		<th>#</th>
		<th>題名</th>
		<th>重要度</th>
		<th>期限</th>
	</tr>

<% while ( rs.next()){ %>
	<tr>
		<td><%=rs.getInt("id") %></td>
		<td><a href="update.html"><%=rs.getString("title") %></a></td>
		<td><%=rs.getString("star") %></td>
		<td><%=rs.getString("deadline") %></td>
	</tr>
<% } %>

</table>

<div class="form-group">
	<a href="entry.html" class="btn btn-primary"><span class="glyphicon glyphicon" aria-hidden="true"></span>追加</a>
</div>

<jsp:include page="footer.jsp" />