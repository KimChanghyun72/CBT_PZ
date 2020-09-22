package common;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//HttpUtil 사용 전역변수
public class HttpUtil {
	public static void forward(HttpServletRequest request,
								HttpServletResponse response, String path) {
		try {
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		} catch (Exception ex) {
			System.out.println("forward 오류 : " + ex);
		}
	}
}
