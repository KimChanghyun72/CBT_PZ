package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.AdminDAO;
import model.AdminVO;
import model.MemberDAO;
import model.MemberVo;

public class LoginController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adm = request.getParameter("admin");
		System.out.println(adm);
		if (adm != null) {
			//null이 아니면 체크되어서 넘어오니까 관리자
			AdminVO adminVO = new AdminVO();
			adminVO.setAdmin_id(request.getParameter("member_id"));
			adminVO.setAdmin_password(request.getParameter("member_pw"));
			AdminVO resultaVO = AdminDAO.getInstance().selectAdminOne(adminVO);
			
			if(resultaVO == null) {
				String page = "/member/login.jsp";
				request.setAttribute("errormsg", "아이디나 패스워드가 일치하지 않습니다.");
				request.setAttribute("errorcode", "3");
				//System.out.println(page);
				request.getRequestDispatcher(page).forward(request, response);
			} 
			request.getSession().setAttribute("login", resultaVO);
			request.getSession().setAttribute("loginId", resultaVO.getAdmin_id());
			request.getSession().setAttribute("name", resultaVO.getAdmin_name());
			request.getSession().setAttribute("check", "A"); //어드민 체크
			
			//spring(어드민)에서 세션 옮길수없으니 쿠키에 담음
			Cookie c1 = new Cookie ("name", resultaVO.getAdmin_name());
			c1.setPath("/");
			response.addCookie(c1);
			
			response.sendRedirect(request.getContextPath() + "/indexx.jsp");
			
		} else {
			//null이면 일반회원. 
				
			// 1. 파라미터 VO
			MemberVo memberVo = new MemberVo();
			memberVo.setMember_id(request.getParameter("member_id"));
			memberVo.setMember_pw(request.getParameter("member_pw"));
	
			// 2. 서비스 처리(DB)
			MemberVo resultVo = MemberDAO.getInstance().selectOne(memberVo);
			
	
			// 3. 결과 저장
			String page = "";
			if (resultVo == null) { // id가 없음
				
				 request.setAttribute("errormsg", "해당 ID가 없습니다.");
				 request.setAttribute("errorcode", "3");
				 
				page = "/member/login.jsp";
				//System.out.println(page);
				request.getRequestDispatcher(page).forward(request, response);
			} else { // 있으면 패스워드 일치 확인
				if (memberVo.getMember_pw().equals(resultVo.getMember_pw())) { // 로그인성공
					resultVo.setPay_enddate((resultVo.getPay_enddate()).substring(0,10));
					request.getSession().setAttribute("login", resultVo);
					request.getSession().setAttribute("name", resultVo.getMember_name());
					request.getSession().setAttribute("loginId", resultVo.getMember_id());
					request.getSession().setAttribute("check", "M"); //멤버 체크
					response.sendRedirect(request.getContextPath() + "/indexx.jsp");
				} else { // 패스워드 불일치
					request.setAttribute("errormsg", "아이디나 패스워드가 일치하지 않습니다.");
					request.setAttribute("errorcode", "3");
					page = "/member/login.jsp";
					request.getRequestDispatcher(page).forward(request, response);
				}
			}
		}

	}

}
