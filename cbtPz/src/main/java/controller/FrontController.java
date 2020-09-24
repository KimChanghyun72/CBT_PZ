 package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.ExcelInsertCtrl;


/**
 * Servlet implementation class FrontController
 */

/*
@WebServlet(name = "front", 
			urlPatterns = "*.do", 
			initParams = 
			{
					@WebInitParam(name = "charset", value = "UTF-8")
			})  //여기적거나 web-int에 web.xml 파일에 적거나. 책550p
*/
//@MultipartConfig(location = "E:/upload", maxRequestSize = 1024 * 1024 * 10)
@MultipartConfig(location = "c:/upload", maxRequestSize = 1024 * 1024 * 10)
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	String charset = null;
	HashMap<String, Controller> list = null;
	
	//메모리 로딩 1번만 - init()  url <-> sub controller 매핑
    @Override
	public void init(ServletConfig config) throws ServletException {
    	charset = config.getInitParameter("charset"); //initparam_name 읽음
    	list = new HashMap<String, Controller>();

    	
    	//김민기
    	list.put("/boardInsert.do", new board.BoardInsertCtrl());
    	list.put("/boardSelect.do", new board.BoardSelectCtrl());
    	list.put("/boardList.do", new board.BoardListCtrl());
    	list.put("/boardUpdate.do", new board.BoardUpdateCtrl());
    	list.put("/boardUpdateForm.do", new board.BoardUpdateFormCtrl());
    	list.put("/boardDelete.do", new board.BoardDeleteCtrl());    	
    	list.put("/commentList.do", new board.CommentListCtrl());
    	list.put("/commentInsert.do",new board.CommentInsertCtrl());
    	list.put("/commentDelete.do", new board.CommentDeleteCtrl());
    	
    	
    	
    	
    	
    	//김창현
    	//list.put("/memberPayUpdate.do", new member.MemberUpdateController());
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	//정유정
    	list.put("/myInfo.do", new member.MemberSearchctrl());					// 개인 정보 수정 페이지로 이동
    	list.put("/memberUpdate.do", new member.MemberUpdateController());		// 개인 정보 수정 처리
    	list.put("/memberDelete.do", new member.MemberDelController());			// 개인 정보 삭제 처리
    	list.put("/insertLecture.do", new teacher.LectureInsertCtrl());			// 강의 등록 처리
    	list.put("/insertLecForm.do", new teacher.insertLecFormCtl());			// 강의 등록 페이지로 이동
    	list.put("/myLecture.do", new teacher.myLectureCtrl());					// 강사) 강의 조회 페이지
    	list.put("/lectureSelect.do", new teacher.LectureSelectCtrl());			// 이미지 불러오기
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	//양수동
    	list.put("/haederSearch.do", new study.HeaderSelectCtrl());
    	list.put("/problemSearch.do", new study.ProblemSelectCtrl());
    	list.put("/subjectSearch.do", new study.SubjectSelectCtrl());
    	list.put("/hashtagPage.do", new study.HashPageCtrl());
    	list.put("/hashtagSelect.do", new study.HashSelectCtrl());
    	list.put("/ajax/hashtagAutoSearch.do", new study.HashAutoSearchCtrl());
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	//철희
    	list.put("/problemInsert.do", new admin.ProblemInsertCtrl());
    	list.put("/excelInsert.do", new admin.ExcelInsertCtrl());
    	list.put("/hashInsert.do", new admin.HashInsertCtrl());
    	
    	
    	
    	
    
    	
    	
    	
    	
    	
    	
    	
    	//민영
    	list.put("/nostms/login.do", new member.LoginController());
    	list.put("/logout.do", new member.LogoutController());
    	list.put("/nostms/memInsert.do", new member.MemInsertCtrl());
    	list.put("/nostms/profInsert.do", new teacher.ProfInsertCtrl());
    	list.put("/nostms/teacherlogin.do", new teacher.ProfLoginCtrl());
    	list.put("/ajax/memIdCheck.do", new member.MemIdCheckCtrl()); //login.jsp
    	list.put("/ajax/memEmailCheck.do", new member.MemEmailCheckCtrl());
    	list.put("/ajax/profIdCheck.do", new teacher.ProfIdCheckCtrl()); //login.jsp
    	list.put("/ajax/memIdFind.do", new member.MemIdFindCtrl()); //findId.jsp
    	list.put("/ajax/memPwFind.do", new member.MemPwFindCtrl()); //findId.jsp
    	
    	
    	list.put("/mainCtrl.do", new common.MainCtrl()); // main.jsp 구동하는 서블릿 (indexx.jsp)
	}

    //요청시마다 service()
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding(charset);
		String uri = request.getRequestURI();   			//   frontWeb/memberInsert.do
		String contextPath = request.getContextPath();      //	 frontWeb 이뒤를 잘라야하니까
		String path = uri.substring(contextPath.length());  //   /memberInsert.do
		Controller subController = list.get(path);
		subController.execute(request, response);
	}
	

}
