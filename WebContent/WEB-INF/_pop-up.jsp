<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--
	<div class="alert alert-success"  role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4><strong>完了しました！</strong></h4>
		<ul>
			<li>No.27のTodoを更新しました</li>
		</ul>
	</div>
-->
	
	<c:if test="${errors.size() > 0}">
		<div class="alert alert-danger alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4><strong>エラーが発生しました！</strong></h4>
			<ul>
			<c:forEach var="error" items="${errors}">
				<li>${error}</li>
			</c:forEach>
			</ul>
		</div>	
	</c:if>