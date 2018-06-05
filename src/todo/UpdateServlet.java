package todo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.ResolverStyle;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import todo.beans.Todo;
import todo.utils.DBUtils;
import todo.utils.HTMLUtils;

@WebServlet("/update.html")
public class UpdateServlet extends HttpServlet {
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

			sql = "select * from todo where id = ?";
			//select命令の準備
			ps = con.prepareStatement(sql);

			//select文にパラメータの内容をセット
			ps.setString(1, req.getParameter("id"));

			//select命令を実行
			rs = ps.executeQuery();

			rs.next();

			int id = rs.getInt("id");
			String title = rs.getString("title");
			String note = rs.getString("note");
			String star = rs.getString("star");
			Date deadline = rs.getDate("deadline");

			Todo todo = new Todo(id, title, note, star, deadline);
			req.setAttribute("todo", todo);

			//JSPへフォワード
			getServletContext().getRequestDispatcher("/WEB-INF/update.jsp")
					.forward(req, resp);

		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			try {
				if (rs != null) {
					con.close();
				}
				if (ps != null) {
					ps.close();
				}
				//if (con != null) {con.close();}
				DBUtils.close(con);
			} catch (Exception e) {
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();

		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String note = req.getParameter("note");
		String star = req.getParameter("star");
		String deadline = req.getParameter("deadline");

		//バリデーションチェック
		List<String> errors = validate(id, title, deadline, star);
		if (errors.size() > 0) {
			session.setAttribute("errors", errors);
			getServletContext().getRequestDispatcher("/WEB-INF/update.jsp").forward(req, resp);
			return;
		}

		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;

		try {
			con = DBUtils.getConnection();

			sql = "update todo set title = ?, note = ?, star = ?, deadline = ? where id = ?;";
			ps = con.prepareStatement(sql);

			//insert命令にポストデータの内容をセット
			ps.setString(1, title);
			ps.setString(2, note);
			ps.setString(3, star);

			if (deadline.equals("")) {
				ps.setString(4, null);
			} else {
				ps.setString(4, deadline);
			}
			ps.setString(5, id);

			ps.executeUpdate();

			List<String> successes = new ArrayList<>();
			successes.add("更新しました。");
			session.setAttribute("successes", successes);

			resp.sendRedirect("index.html");
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
			}
		}
	}

	private List<String> validate(String id, String title, String deadline, String star) {
		List<String> errors = new ArrayList<>();

		//idの必須
		if (id == null || id.equals("")) {
			errors.add("不正なアクセスです。");
		}

		//題名の必須入力チェック
		if (title.equals("")) {
			errors.add("題名は必須入力です。");
		}

		//題名100文字以内
		if (title.length() > 100) {
			errors.add("題名は100文字以内にしてください。");
		}

		//日付フォーマットs
		if (!deadline.equals("")) {
			try {
				LocalDate.parse(deadline, DateTimeFormatter.ofPattern("uuuu/MM/dd")
						.withResolverStyle(ResolverStyle.STRICT));
			} catch (Exception e) {
				errors.add("期限は「YYYY/MM/DD」形式で入力してください。");

			}
		}

		//重要度★～★★★チェック
		if (!star.equals("★") && !star.equals("★★") && !star.equals("★★★")) {
			errors.add("不正なアクセスです。");
		}

		return errors;
	}
}