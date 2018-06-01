<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="todo.utils.HTMLUtils" %>

	<jsp:include page="_header.jsp" />
	
	<jsp:include page="_pop-up.jsp" />
		
	<form class="form-horizontal" action="#" method="post">

		<h4><strong>登録フォーム</strong></h4>
		<hr>
		
		<div class="form-group">
 			<label for="note" class="col-sm-2 control-label">題名</label>
 			<div class="col-sm-10">
				<input type="text" class="form-control" name="title" placeholder="題名" value="${param.title}">
			</div>
		</div>

		<div class="form-group">
 			<label for="note" class="col-sm-2 control-label">詳細</label>
 			<div class="col-sm-10">
				<textarea class="form-control" name="note" rows="3" placeholder="詳細">${param.note}</textarea>
			</div>
		</div>
		
		<div>
			<div class="form-group">
				<label for="star3" class="col-sm-2 control-label">重要度</label>
					<div class="col-sm-10">
						<div class="radio">
							<label>
								<input type="radio" name="star" id="star3" value="★★★" ${HTMLUtils.checkStar(param.star, '★★★')}>
								★★★
							</label>
						</div>
						
						<div class="radio">
							<label>
								<input type="radio" name="star" value="★★" ${HTMLUtils.checkStar(param.star, '★★')}>
								★★
							</label>
						</div>
							
						<div class="radio">
							<label>
								<input type="radio" name="star" value="★" ${HTMLUtils.checkStar(param.star, '★')}>
								★
							</label>
						</div>
					</div>
			</div>
		</div>	

			
		<div class="form-group">
 			<label for="note" class="col-sm-2 control-label">期限</label>
 			<div class="col-sm-10">
				<input type="text" class="form-control" name="deadline" placeholder="期限" value="${param.deadline}">
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<a href="index.html" class="btn btn-default"><span class="glyphicon glyphicon" aria-hidden="true"></span>キャンセル</a>
				<input type="submit" class="btn btn-primary" value="追加"/>
			</div>
		</div>
	</form>
		<jsp:include page="_footer.jsp" />