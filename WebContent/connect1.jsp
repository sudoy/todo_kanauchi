<%@page import="java.sql.*,javax.naming.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>データベース接続</title>
</head>
<body>

<%
	//context.xmlのリソースへアクセス
	Context initContext = new InitialContext();
	Context envContext = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/mysql");
	
	//コネクションプールからコネクションを一つもらう
	Connection con = ds.getConnection();
	
	//コネクションを返す
	con.close();
%>データベースの接続に成功

</body>
</html>