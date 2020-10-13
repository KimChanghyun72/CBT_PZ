 package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig(location = "C:/upload", maxRequestSize = 1024 * 1024 * 10)
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
    	list.put("/board/boardInsert.do", new board.BoardInsertCtrl());  		//자유게시판 입력
    	list.put("/board/boardSelect.do", new board.BoardSelectCtrl());			//자유게시판 단건 조회
    	list.put("/board/boardList.do", new board.BoardListCtrl());				//자유게시판 전체 리스트
    	list.put("/board/boardUpdate.do", new board.BoardUpdateCtrl());			//자유게시판 수정
    	list.put("/board/boardUpdateForm.do", new board.BoardUpdateFormCtrl());	//자유게시판 수정입력폼
    	list.put("/board/boardDelete.do", new board.BoardDeleteCtrl());    		//자유게시판 삭제
    	list.put("/ajax/commentList.do", new board.CommentListCtrl());			//댓글 목록조회
    	list.put("/ajax/commentInsert.do",new board.CommentInsertCtrl());		//댓글 입력
    	list.put("/ajax/commentDelete.do", new board.CommentDeleteCtrl()); 		//댓글 삭제
    	list.put("/board/qaboardList.do", new board.QaBoardListCtrl()); 		//QA게시판 전체 리스트
    	list.put("/board/qaboardSelect.do", new board.QaBoardSelectCtrl());		//QA게시판 단건 조회
    	list.put("/board/qaboardInsert.do", new board.QaBoardInsertCtrl());		//QA게시판 입력
    	list.put("/board/qaboardDelete.do", new board.QaBoardDeleteCtrl());		//QA게시판 삭제
    	list.put("/board/qaboardUpdate.do", new board.QaBoardUpdateCtrl());		//QA게시판 수정
    	list.put("/board/qaboardUpdateForm.do", new board.QaBoardUpdateFormCtrl());//QA게시판 수정입력품
    	list.put("/filenameDownload.do", new board.FilenameDownloadCtrl());		//사진파일 다운로드
    	list.put("/ajax/qacommentUpdate.do", new board.QaCommentUpdateCtrl());	//QA댓글입력
    	list.put("/ajax/qacommentList.do", new board.QaCommentListCtrl());		//QA댓글목록조회
    	list.put("/board/noticeList.do", new board.NoticeListCtrl());			//공지사항 리스트
    	list.put("/board/noticeInsert.do", new board.NoticeInsertCtrl());		//공지사항 입력
    	list.put("/board/noticeSelect.do", new board.NoticeSelectCtrl());		//공지사항 단건조회
    	list.put("/board/noticeDelete.do", new board.NoticeDeleteCtrl());		//공지사항 삭제
    	list.put("/board/noticeUpdate.do", new board.NoticeUpdateCtrl());		//공지사항 수정
    	list.put("/board/noticeUpdateForm.do", new board.NoticeUpdateFormCtrl());//공지사항 수정입력폼
    	
    	
    	//김창현
    	//list.put("/memberPayUpdate.do", new member.MemberUpdateController());
    	list.put("/ajax/probScoringCtrl.do", new study.ProbScoringCtrl());
    	list.put("/payInsertCtrl.do", new pay.PayInsertCtrl());
    	list.put("/ajax/deleteLecture.do", new member.MemLectureDeleteCtrl());
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	//정유정
    	list.put("/mypage/myInfo.do", new member.MemberSearchctrl());					// 개인 정보 수정 페이지로 이동
    	list.put("/mypage/memberUpdate.do", new member.MemberUpdateController());		// 개인 정보 수정 처리
    	list.put("/mypage/memberDelete.do", new member.MemberDelController());			// 개인 정보 삭제 처리
    	list.put("/mypage/insertLecture.do", new teacher.LectureInsertCtrl());			// 강의 등록 처리
    	list.put("/mypage/insertLecForm.do", new teacher.insertLecFormCtl());			// 강의 등록 페이지로 이동
    	list.put("/mypage/myLecture.do", new teacher.myLectureCtrl());					// 강사) 강의 조회 페이지
    	list.put("/lectureSelect.do", new teacher.LectureSelectCtrl());					// 이미지 불러오기
    	list.put("/mypage/memLecture.do", new member.MemLectureCtrl());					// 회원) 강의 조회 페이지
    	list.put("/mypage/myInput.do", new member.MyInputCtrl());						// 회원 작성글 조회 페이지
    	list.put("/mypage/myInputSelect.do", new member.MyInputSelectCtrl());			// 작성글 상세 페이지로 이동
    	list.put("/ajax/teacherLectureDelete.do", new teacher.teacherLectureDel());		// 강사 강의 삭제
    	list.put("/mypage/myInputDel.do", new member.myInputDelete());					// 작성글 체크박스
    	
    	list.put("/ajax/myFavoriteInsert.do", new retest.MyFavoriteInsertCtrl());		// 즐겨찾기 등록		
    	list.put("/ajax/myFavoriteDelete.do", new retest.MyFavoriteDeleteCtrl());		// 즐겨찾기 해제	
    	list.put("/mypage/myFavorite.do", new retest.MyFavoriteCtrl());					// 즐겨찾기 문제 출력
    	list.put("/mypage/myRetestList.do", new retest.MyRetestCtrl());					// 오답노트 응시리스트 출력
    	list.put("/mypage/myRetestSelect.do",new retest.MyRetestSelect());				// 오답노트 재응시 문제조회
    	list.put("/mypage/myRetest.do",new retest.MyRetestInsert());					// 오답노트 재응시
    	
    	
    	
    	
    	
    	
    	
    	//양수동
    	list.put("/study/haederSearch.do", new study.HeaderSelectCtrl());
    	list.put("/study/problemHead.do", new study.ProblemHeadCtrl());
    	list.put("/problemSubject.do", new study.ProblemSubCtrl());
    	list.put("/study/subjectSearch.do", new study.SubjectSelectCtrl());
    	list.put("/study/hashtagPage.do", new study.HashPageCtrl());
    	list.put("/hashtagSelect.do", new study.HashSelectCtrl());
    	list.put("/ajax/hashtagAutoSearch.do", new study.HashAutoSearchCtrl());
    	
    	list.put("/ajax/paperUpdate.do", new study.PaperUpdateCtrl());

    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	//철희
    	list.put("/problemInsert.do", new admin.ProblemInsertCtrl());


    	list.put("/hashInsert.do", new admin.HashInsertCtrl());
    	list.put("/excelInsert.do", new admin.ExcInsertCtrl());
    	
    	list.put("/ajax/studyChart.do", new admin.StudyTermChartCtrl());
    	list.put("/ajax/majorChart.do", new admin.MajorChartCtrl());
    	
    	list.put("/memberList.do", new admin.MemberListCtrl());
    	list.put("/memberUpdateForm.do", new member.MemberUpdateFormCtrl());
    	
    	list.put("/ajax/scheduler.do", new admin.SchedulerCtrl());
    	list.put("/ajax/schedulerList.do", new admin.SchedulerSelectCtrl());
    	
    	
    
    	
    	
    	
    	
    	
    	
    	
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
    	
    	list.put("/lecturePage.do", new lecture.LecturePageCtrl()); //강의 전체리스트 메인 페이지 (전체 || 카테별 보여주는 서블릿)
    	list.put("/ajax/lectureLearnInsert.do", new lecture.LectureLearnInsert()); //강의 수강하기 버튼 클릭시 learn table 인서트
    	list.put("/lectureSearch.do", new lecture.LectureSearchCtrl()); //강의검색
    	
    	list.put("/nostms/profilepicSelect.do", new teacher.ProfPicSelectCtrl()); //강사 프로필사진
    	list.put("/mypage/proUpdate.do", new teacher.ProfUpdateCtrl()); //강사 개인정보수정
    	list.put("/mypage/proDelete.do", new teacher.ProfDeleteCtrl()); //강사 탈퇴
    	
    	list.put("/mypage/myRetestStat.do", new member.myRetestStatCtrl()); //마이페이지-개인통계
    	list.put("/ajax/myRetestStatLineChart.do", new member.myRetestStatLineChartCtrl()); // 개인통계-라인차트
    	list.put("/ajax/myRetestStatBarChart.do", new member.myRetestStatBarChartCtrl()); // 개인통계-바차트
    	
    	//list.put("/ajax/fullCalendar.do", new member.FullCalendarCtrl()); //풀캘린더실험용
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
