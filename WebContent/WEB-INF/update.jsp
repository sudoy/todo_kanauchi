<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="todo.utils.HTMLUtils" %>


	<jsp:include page="_header.jsp" />
	
	<jsp:include page="_pop-up.jsp" />
	
	<form class="form-horizontal" action="update.html?id=${todo.id}" method="post">
	
		<h4><strong>更新フォーム</strong></h4>
		<hr>
		
		<div class="form-group">
 			<label for="note" class="col-sm-2 control-label">題名</label>
 			<div class="col-sm-10">
				<input type="text" class="form-control" name="title" value="${todo.title}" placeholder="題名">
			</div>
		</div>

		<div class="form-group">
 			<label for="note" class="col-sm-2 control-label">詳細</label>
 			<div class="col-sm-10">
				<textarea class="form-control" name="note" rows="3" placeholder="詳細">${todo.note}</textarea>
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">重要度</label>
				<div class="radio">					
					　<label><input type="radio" name="star" value="${todo.star}" ${HTMLUtils.checkStar(todo.star, '★★★')}>★★★</label><br>
					<label for="name" class="col-sm-2 control-label"></label>
					　<label><input type="radio" name="star" value="${todo.star}" ${HTMLUtils.checkStar(todo.star, '★★')}>★★</label><br>
					<label for="name" class="col-sm-2 control-label"></label>
					　<label><input type="radio" name="star" value="${todo.star}" ${HTMLUtils.checkStar(todo.star, '★')}>★</label>
				</div>
		</div>
		
		<div class="form-group">
 			<label for="note" class="col-sm-2 control-label">期限</label>
 			<div class="col-sm-10">
				<input type="text" class="form-control" name="title" value="${todo.deadline}" placeholder="期限">
			</div>
		</div>



		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<a href="index.html" class="btn btn-default"><span class="glyphicon glyphicon" aria-hidden="true"></span>キャンセル</a>
				<a href="index.html" class="btn btn-primary"><span class="glyphicon glyphicon" aria-hidden="true"></span>更新</a>
			</div>
			<div class="col-sm-offset-4">
				<a href="index.html" class="btn btn-danger" align="right"><span class="glyphicon glyphicon" aria-hidden="true"></span>削除</a>
			</div>	
		</div>
	</form>
		<jsp:include page="_footer.jsp" />
