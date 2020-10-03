package pay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberVo;
import model.PayDAO;
import model.PayVO;

public class PayInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//결제에 필요한 파라미터값 입력
		String pay_type = request.getParameter("term");
		int price = Integer.parseInt(request.getParameter("price"));
		String payCheck = request.getParameter("pay");
		MemberVo memberVO = (MemberVo) request.getSession().getAttribute("login");
		String member_id = memberVO.getMember_id();
		
		PayVO payVo = new PayVO();
		payVo.setMember_id(member_id);
		payVo.setPay_type(pay_type);
		payVo.setPay_price(price);
		PayDAO.getInstance().insert(payVo); 
		
		//멤버정보 업데이트를 위해 결제업데이트 전용 키, 결제기간(pay_type)을 넘김
		request.setAttribute("payCheck", payCheck);
		request.setAttribute("term", pay_type);
		/*
		 * String path = request.getContextPath()+"/memberUpdate.do";
		 * System.out.println(path);
		 */
		
		request.getRequestDispatcher("/memberUpdate.do").forward(request, response);
		
	}

}
