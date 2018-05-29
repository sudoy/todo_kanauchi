<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

	<jsp:include page="header.jsp" />
	
	<jsp:include page="pop-up.jsp" />
		
		<table class="table">
			<tr>
				<th>#</th>
				<th>題名</th>
				<th>重要度</th>
				<th>期限</th>
			</tr>
			
			<tr>
				<td>1</td>
				<td><a href="update.html">テストテスト</a></td>
				<td>★★★</td>
				<td>2015/06/20</td>
			</tr>
			
			<tr>
				<td>2</td>
				<td><a href="update.html">テストテスト</a></td>
				<td>★</td>
				<td>2015/06/22</td>
			</tr>
			<tr>
				<td>3</td>
				<td><a href="update.html">テストテスト</a></td>
				<td>★★★</td>
				<td>2015/06/20</td>
			</tr>
			<tr>
				<td>4</td>
				<td><a href="update.html">テストテスト</a></td>
				<td>★★</td>
				<td></td>
			</tr>
			

		</table>			
		
		<div class="form-group">
				<a href="entry.html" class="btn btn-primary"><span class="glyphicon glyphicon" aria-hidden="true"></span>追加</a>
		</div>

		<jsp:include page="footer.jsp" />