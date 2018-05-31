<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="todo.utils.HTMLUtils"%>

<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="_header.jsp" />

<jsp:include page="_pop-up.jsp" />

<table class="table">
	<tr>
		<th>#</th>
		<th>題名</th>
		<th>重要度</th>
		<th>期限</th>
	</tr>

	<c:forEach var="todo" items="${list}" varStatus="t">
		<tr>
			<td>${todo.id}</td>
			<td><a href="update.html">${todo.title}</a></td>
			<td>${todo.star}</td>
			<td>${HTMLUtils.dateFormat(todo.deadline)}</td>
		</tr>
		
	</c:forEach>

</table>

<div class="form-group">
	<a href="entry.html" class="btn btn-primary"><span class="glyphicon glyphicon" aria-hidden="true"></span>追加</a>
</div>

<jsp:include page="_footer.jsp" />