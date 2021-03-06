package todo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import todo.beans.Todo;
import todo.utils.DBUtils;
import todo.utils.HTMLUtils;

@WebServlet("/index.html")
public class IndexServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		//ログインチェック
		if(!HTMLUtils.checkLogin(req, resp)) {
			return;
		}
		
		req.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;
		ResultSet rs = null;

		try {
			con = DBUtils.getConnection();

			sql = "select id, title,  note, star, deadline from todo order by id;";

			//select命令の準備
			ps = con.prepareStatement(sql);

			//select命令を実行
			rs = ps.executeQuery();

			List<Todo> list = new ArrayList<>();
			while (rs.next()) {
				Todo t = new Todo(
						rs.getInt("id"),
						rs.getString("title"),
						rs.getString("note"),
						rs.getString("star"),
						rs.getDate("deadline"));
				list.add(t);
			}

			req.setAttribute("list", list);

			getServletContext().getRequestDispatcher("/WEB-INF/index.jsp")
					.forward(req, resp);

		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
			}
		}
	}
}
