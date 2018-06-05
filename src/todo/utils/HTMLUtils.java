package todo.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HTMLUtils {
	public static String dateformat(Date deadline) {

		String s = "";
		if (deadline == null) {
			return "";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		s = sdf.format(deadline);

		return s;
	}

	public static String checkStar(String param, String value) {
		if (param.equals("") && value.equals("★★★")) {
			return "checked";
		} else if (param.equals(value)) {
			return "checked";
		} else {
			return "";
		}
	}
	
	public static boolean checkLogin(HttpServletRequest req, HttpServletResponse resp)
					throws IOException{
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("userdata")== null) {
			
			List<String> errors = new ArrayList<>();
			errors.add("ログインしてください。");
			session.setAttribute("errors", errors);
			resp.sendRedirect("login.html");
			return false;		
		}else {
			return true;
		}
		
	}
	
}
