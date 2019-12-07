package com.had.hotelmanagement.Interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
public class LoggerInterceptor extends HandlerInterceptorAdapter {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
 
		HttpSession session = request.getSession();

		boolean isLogined = session.getAttribute("check") != null ? (Boolean) session.getAttribute("check") : false;

		if (!isLogined) {
			response.sendRedirect("login");
			return false;

		}

		return true;

	}

	
}
