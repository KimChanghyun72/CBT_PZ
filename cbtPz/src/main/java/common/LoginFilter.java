package common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;

public class LoginFilter implements Filter {
	List<String> list = new ArrayList<String>();
	
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("login filter ����");
		
		String uri = ((HttpServletRequest) request).getRequestURI();
		String path = uri.substring(((HttpServletRequest) request).getContextPath().length());
		//System.out.println(path);
		//String uri = ((HttpServletRequest) request).getRequestURI();
		HttpSession session = ((HttpServletRequest) request).getSession();
		
		int cnt = 0;
		
		for(String i : list) {
			if(path.equals(i)) {
				cnt++;
			}
			
			//System.out.println(cnt);
			if(cnt > 0) {
				//if (session.isNew() == true) {
					String contextPath = ((HttpServletRequest) request).getContextPath();
					//System.out.println(session.isNew());
					if (session.getAttribute("login") == null) {
						((HttpServletResponse) response).sendRedirect(contextPath + "/member/login.jsp");
						return;
						//System.out.println(session.isNew());
					}
					//chain.doFilter(request, response);
					//System.out.println("login filter end ���� ����");
				//}
				
			}
			
		}
		 chain.doFilter(request, response); 
		System.out.println("login filter end ���� ����");
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		list.add("/board/boardInsert.do");  		//자유게시판 입력
    	//list.add("/board/boardSelect.do");			//자유게시판 단건 조회
    	//list.add("/board/boardList.do");				//자유게시판 전체 리스트
    	list.add("/board/boardUpdate.do");			//자유게시판 수정
    	list.add("/board/boardUpdateForm.do");	//자유게시판 수정입력폼
    	list.add("/board/boardDelete.do");    		//자유게시판 삭제
    	//list.add("/ajax/commentList.do");			//댓글 목록조회
    	//list.add("/ajax/commentInsert.do");		//댓글 입력
    	//list.add("/ajax/commentDelete.do"); 		//댓글 삭제
    	//list.add("/board/qaboardList.do"); 		//QA게시판 전체 리스트
    	//list.add("/board/qaboardSelect.do");		//QA게시판 단건 조회
    	list.add("/board/qaboardInsert.do");		//QA게시판 입력
    	list.add("/board/qaboardDelete.do");		//QA게시판 삭제
    	list.add("/board/qaboardUpdate.do");		//QA게시판 수정
    	list.add("/board/qaboardUpdateForm.do");//QA게시판 수정입력품
    	//list.add("/filenameDownload.do");		//사진파일 다운로드
    	//list.add("/ajax/qacommentUpdate.do");	//QA댓글입력
    	//list.add("/ajax/qacommentList.do");		//QA댓글목록조회
    	//list.add("/board/noticeList.do");			//공지사항 리스트
    	list.add("/board/noticeInsert.do");		//공지사항 입력
    	//list.add("/board/noticeSelect.do");		//공지사항 단건조회
    	list.add("/board/noticeDelete.do");		//공지사항 삭제
    	list.add("/board/noticeUpdate.do");		//공지사항 수정
    	list.add("/board/noticeUpdateForm.do");//공지사항 수정입력폼
    	
    	
    	//김창현
    	//list.add("/memberPayUpdate.do", new member.MemberUpdateController());
    	//list.add("/ajax/probScoringCtrl.do");
    	//list.add("/payInsertCtrl.do");
    	list.add("/ajax/deleteLecture.do");
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	//정유정
    	list.add("/mypage/myInfo.do");					// 개인 정보 수정 페이지로 이동
    	list.add("/mypage/memberUpdate.do");		// 개인 정보 수정 처리
    	list.add("/mypage/memberDelete.do");			// 개인 정보 삭제 처리
    	list.add("/mypage/insertLecture.do");			// 강의 등록 처리
    	list.add("/mypage/insertLecForm.do");			// 강의 등록 페이지로 이동
    	list.add("/mypage/myLecture.do");					// 강사) 강의 조회 페이지
    	//list.add("/lectureSelect.do");					// 이미지 불러오기
    	list.add("/mypage/memLecture.do");					// 회원) 강의 조회 페이지
    	list.add("/mypage/myInput.do");						// 회원 작성글 조회 페이지
    	list.add("/myInputSelect.do");					// 작성글 상세 페이지로 이동
    	list.add("/mypage/myRetest.do");							// 오답노트 문제 출력
    	list.add("/mypage/myFavorite.do");						// 즐겨찾기 문제 출력
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	//양수동
    	//list.add("/haederSearch.do");
    	list.add("/problemHead.do");
    	//list.add("/problemSubject.do");
    	//list.add("/subjectSearch.do");
    	//list.add("/hashtagPage.do");
    	//list.add("/hashtagSelect.do");
    	//list.add("/ajax/hashtagAutoSearch.do");
    	
    	//list.add("/ajax/paperUpdate.do");

    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	//철희
    	//list.add("/problemInsert.do");


    	//list.add("/hashInsert.do");
    	//list.add("/ajax/studyChart.do");
    	//list.add("/ajax/majorChart.do");
    	//list.add("/memberList.do");
    	//list.add("/memberUpdateForm.do");
    	//list.add("/excelInsert.do");
    	
    	
    	
    
    	
    	
    	
    	
    	
    	
    	
    	//민영
    	//list.add("/nostms/login.do");
    	//list.add("/logout.do");
    	//list.add("/nostms/memInsert.do");
    	//list.add("/nostms/profInsert.do");
    	//list.add("/nostms/teacherlogin.do");
    	//list.add("/ajax/memIdCheck.do"); //login.jsp
    	//list.add("/ajax/memEmailCheck.do");
    	//list.add("/ajax/profIdCheck.do"); //login.jsp
    	//list.add("/ajax/memIdFind.do"); //findId.jsp
    	//list.add("/ajax/memPwFind.do"); //findId.jsp
    	
    	
    	//list.add("/lecturePage.do"); //강의 전체리스트 메인 페이지 (전체 || 카테별 보여주는 서블릿)
    	list.add("/ajax/lectureLearnInsert.do"); //강의 수강하기 버튼 클릭시 learn table 인서트
    	
    	//list.add("/nostms/profilepicSelect.do"); //강사 프로필사진
    	list.add("/mypage/proUpdate.do"); //강사 개인정보수정
    	list.add("/mypage/proDelete.do"); //강사 탈퇴
    	
    	list.add("/mypage/myRetestStat.do"); //개인통계페이지
    	
    	//list.add("/ajax/fullCalendar.do"); //풀캘린더실험용
    	//list.add("/mainCtrl.do"); // main.jsp 구동하는 서블릿 (indexx.jsp)
	}

}
