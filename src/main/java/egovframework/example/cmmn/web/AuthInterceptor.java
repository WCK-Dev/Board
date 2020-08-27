package egovframework.example.cmmn.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("user_id");
		
		if(obj == null || obj.equals("")) { 
			response.sendRedirect("/Board/login.do");
			return false;
		}
		return true; // 조건문에 걸리지않으면 (로그인 상태이면) 컨트롤러에 요청정보를 전송하게 됨
	}
	
}
