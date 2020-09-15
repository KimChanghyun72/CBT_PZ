package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import controller.Controller;
import model.MemberDAO;
import model.MemberVo;

public class LoginController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 파라미터 VO
		MemberVo memberVo = new MemberVo();
		memberVo.setId(request.getParameter("username"));
		memberVo.setPw(request.getParameter("password"));

		// 2. 서비스 처리(DB)
		MemberVo resultVo = MemberDAO.getInstance().selectOne(memberVo);

		// 3. 결과 저장
		String page = "";
		if (resultVo == null) { // id가 없음
			request.setAttribute("errormsg", "해당 ID가 없습니다.");
			page = "/login.jsp";
			System.out.println(page);
			request.getRequestDispatcher(page).forward(request, response);
		} else { // 있으면 패스워드 일치 확인
			if (memberVo.getPw().equals(resultVo.getPw())) { // 로그인성공
				request.getSession().setAttribute("login", resultVo);
				request.getSession().setAttribute("id", resultVo.getId());
				response.sendRedirect("sayingList.do");
			} else { // 패스워드 불일치
				request.setAttribute("errormsg", "패스워드 불일치");
				page = "/login.jsp";
				request.getRequestDispatcher(page).forward(request, response);
			}
		}

	}

}
