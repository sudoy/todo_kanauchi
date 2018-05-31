package todo.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class HTMLUtils {
	public static String dateformat(Date deadline) {

		String s = "";
		if(deadline == null) {
			return "";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		s = sdf.format(deadline);

		return s;
}
}
