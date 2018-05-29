<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ja">

	<jsp:include page="header.jsp" />


	<div class="container">
	
		<jsp:include page="pop-up.jsp" />
		
		<p><strong>登録フォーム</strong></p>
		<hr>
		
		<div class="form-group">
 			<label for="note" class="col-sm-2 control-label">題名</label>
 			<div class="col-sm-10">
				<input type="text" class="form-control" name="title" placeholder="題名">
			</div>
		</div>

		<div class="form-group">
 			<label for="note" class="col-sm-2 control-label">詳細</label>
 			<div class="col-sm-10">
				<textarea class="form-control" name="note" rows="3" placeholder="詳細"></textarea>
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
				<input type="text" class="form-control" name="title" placeholder="期限">
			</div>
		</div>



		<div class="form-group">
		<div class="col-sm-offset-2">
			<a href="index.html" class="btn btn-default"><span class="glyphicon glyphicon" aria-hidden="true"></span>キャンセル</a>
			<a href="index.html" class="btn btn-primary"><span class="glyphicon glyphicon" aria-hidden="true"></span>追加</a>
			</div>
		</div>

		</div><!-- /container -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		</form>
	</body>
</html>