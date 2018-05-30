package todo.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

public class DBUtils extends HttpServlet {
	public static Connection getConnection() 
			throws NamingException, SQLException {
		//データベースの接続を確立
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("todolist_kanauchi");

		return ds.getConnection();
	}
	
	public static void close(Connection con) throws SQLException {
		if (con != null) {
			con.close();
		}
	}
}