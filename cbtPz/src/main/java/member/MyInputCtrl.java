package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HttpUtil;
import controller.Controller;
import model.BoardDAO;
import model.BoardVO;
import model.MemberVo;

public class MyInputCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Parameter 추출
		MemberVo member = (MemberVo) request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		System.out.println(member_id);
		// member_id를 기준으로 조회
		
		BoardVO boardvo = new BoardVO();
		boardvo.setMember_id(member_id);
		boardvo.setFirst(1);
		boardvo.setLast(10);
		
		// DAO 객체의 메소드 호출
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardVO> board = dao.selectMemberAll(boardvo);
		
		// page 이동
		request.setAttribute("board_list", board);
		HttpUtil.forward(request, response, "/mypage/myInput.jsp");
	}

}
