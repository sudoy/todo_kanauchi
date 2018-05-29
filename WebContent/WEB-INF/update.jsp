<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

	<jsp:include page="header.jsp" />
	
	<jsp:include page="pop-up.jsp" />

		<p><strong>更新フォーム</strong></p>
		<hr>
		
		<div class="form-group">
 			<label for="note" class="col-sm-2 control-label">題名</label>
 			<div class="col-sm-10">
				<input type="text" class="form-control" name="title" value="テストテスト" placeholder="題名">
			</div>
		</div>

		<div class="form-group">
 			<label for="note" class="col-sm-2 control-label">詳細</label>
 			<div class="col-sm-10">
				<textarea class="form-control" name="note" rows="3" placeholder="詳細">SQLの確認テストの採点と報告書を作成する。</textarea>
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">重要度</label>
				<div class="radio">
					　<label><input type="radio" name="star" value="3" checked>★★★</label><br>
					<label for="name" class="col-sm-2 control-label"></label>
					　<label><input type="radio" name="star" value="2">★★</label><br>
					<label for="name" class="col-sm-2 control-label"></label>
					　<label><input type="radio" name="star" value="1">★</label>
				</div>
		</div>
		
		<div class="form-group">
 			<label for="note" class="col-sm-2 control-label">期限</label>
 			<div class="col-sm-10">
				<input type="text" class="form-control" name="title" value="2015/0615" placeholder="期限">
			</div>
		</div>



		<div class="form-group">
			<div class="col-sm-offset-2">
				<a href="index.html" class="btn btn-default"><span class="glyphicon glyphicon" aria-hidden="true"></span>キャンセル</a>
				<a href="index.html" class="btn btn-primary"><span class="glyphicon glyphicon" aria-hidden="true"></span>更新</a>
				<a href="index.html" class="btn btn-danger" align="right"><span class="glyphicon glyphicon" aria-hidden="true"></span>削除</a>

			</div>
		</div>
		
		<jsp:include page="footer.jsp" />
