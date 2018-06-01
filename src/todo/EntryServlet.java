package todo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.ResolverStyle;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import todo.utils.DBUtils;

@WebServlet("/entry.html")
public class EntryServlet extends HttpServlet {
//doget----------------------------------------------
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		getServletContext().getRequestDispatcher("/WEB-INF/entry.jsp")
				.forward(req, resp);
		

	}

//dopost-----------------------------------------------
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String title = req.getParameter("title");
		String note = req.getParameter("note");
		String star = req.getParameter("star");
		String deadline = req.getParameter("deadline");
		
		//バリデーションチェック
		List<String> errors = validate(title, deadline, star);
		if(errors.size() > 0) {
			req.setAttribute("errors", errors);
			getServletContext().getRequestDispatcher("/WEB-INF/entry.jsp").forward(req, resp);
			return;
		}
					
		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;

		try {
			con = DBUtils.getConnection();

			sql = "insert into todo (title, note, star, deadline) values (?, ?, ?, ?)";
			ps = con.prepareStatement(sql);

			ps.setString(1, title);
			ps.setString(2, note);
			ps.setString(3, star);
			if(deadline.equals("")) {
				ps.setString(4, null);
			}else {
				ps.setString(4, deadline);
			}
		
			ps.executeUpdate();
			
			//index.htmlへ遷移
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

	private List<String> validate(String title, String deadline, String star) {
		List<String> errors = new ArrayList<>();
		
		//題名の必須入力チェック
		if(title.equals("")){
			errors.add("題名は必須入力です。");
		}

		//題名100文字以内
		if(title.length() > 100){
			errors.add("題名は100文字以内にしてください。");
		}
		
		//日付フォーマットs
		if(!deadline.equals("")) {
			try {
				LocalDate.parse(deadline, DateTimeFormatter.ofPattern("uuuu/MM/dd")
						.withResolverStyle(ResolverStyle.STRICT));
			}catch(Exception e) {
				errors.add("期限は「YYYY/MM/DD」形式で入力してください。");

			}
		}
		
		//重要度★～★★★チェック
		if(!star.equals("★") && !star.equals("★★") && !star.equals("★★★")) {
			errors.add("不正なアクセスです。");
		}
		
		return errors;
	}
}



