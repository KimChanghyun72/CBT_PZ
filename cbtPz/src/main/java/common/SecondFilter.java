package common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebFilter(filterName = "session", urlPatterns = {"/board/*", "/study/*", "/mypage/*"})
public class SecondFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("second filter ����");
		
		String uri = ((HttpServletRequest) request).getRequestURI();
		if (uri.indexOf("login") < 0) {
			HttpSession session = ((HttpServletRequest) request).getSession();
			String contextPath = ((HttpServletRequest) request).getContextPath();
			if ((session.getAttribute("login").equals("") || session.getAttribute("login").equals(null)) && session.isNew()==true) {
				/* ((HttpServletResponse) response).sendRedirect("member/login"); */
				System.out.println("세션만료조건 만족");
				((HttpServletResponse) response).sendRedirect(contextPath + "/member/login.jsp");
				
			}else {
				System.out.println("세션만료조건 불만족");
			}
			chain.doFilter(request, response);
			return;
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
