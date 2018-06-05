<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="_header.jsp" />
<jsp:include page="_pop-up.jsp" />

		<form class="form-horizontal" action="login.html" method="post">
			<div class="form-group">
				<label for="mail">メールアドレス</label>
				<input type="email" class="form-control" name="email" id="inputemail" placeholder="メールアドレス" value="${param.email}">
			</div>
			
			<div class="form-group">
				<label for="exampleInputPassword1">パスワード</label>
				<input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="パスワード" value="">
			</div>

			<input type ="submit" class="btn btn-info glyphicon glyphicon-off" role="button" value="ログイン">
			
		</form>
<jsp:include page="_footer.jsp" />
		