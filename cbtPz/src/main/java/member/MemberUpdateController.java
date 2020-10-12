package member;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUtils;

import common.HttpUtil;
import controller.Controller;
import model.MemberDAO;
import model.MemberVo;

public class MemberUpdateController implements Controller {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		//유료 결제에 대한 정보 받기
		String payCheck = request.getParameter("payCheck");
		String pay="pay";
		System.out.println(payCheck);
		String term = request.getParameter("term");
		MemberVo pay_member = (MemberVo) request.getSession().getAttribute("login");
		System.out.println("pay_member"+pay_member);
		Calendar cal = Calendar.getInstance();
		
		if (pay.equals(payCheck)) { //회원 결제정보 업데이트
			MemberDAO dao = new MemberDAO();
			String is_pay = "Y"; //유료회원 판단 문자
			int term2 = Integer.parseInt(term);
			
			if(is_pay.equals(pay_member.getIs_pay())) { //유료회원의 경우

				String day = pay_member.getPay_enddate(); //유료회원의 만기일자 불러옴
				day = day.substring(0,10).replace("-", "/"); //포맷 변경
				DateFormat df = new SimpleDateFormat("YYYY/MM/dd");
				try {
					Date date = df.parse(day);
					cal.setTime(date);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				cal.add(Calendar.DATE, term2); //기간 연장
				pay_member.setPay_enddate(df.format(cal.getTime()));
				dao.update(pay_member);
				
			} else {									//유료회원 아닌 경우
				/* Calendar cal = Calendar.getInstance(); */
				pay_member.setIs_pay(is_pay);		//유료회원으로 전환
				 cal.setTime(new Date());
				 DateFormat df = new SimpleDateFormat("YYYY/MM/dd"); 
				 cal.add(Calendar.DATE, term2);
				pay_member.setPay_enddate(df.format(cal.getTime()));
				dao.update(pay_member);
			}
			
			String path = "indexx.jsp";
			response.sendRedirect(path);
			
		}
		
		else { //결제를 제외한 회원 업데이트
			
		// Parameter 추출
		String member_id = request.getParameter("member_id");//pay_member.getMember_id();
		String member_pw = request.getParameter("member_pw");//pay_member.getMember_pw();//
		
		String confirm_pw = request.getParameter("confirm_password");
		
		String member_name = request.getParameter("member_name");//pay_member.getMember_name();//
		String member_age = request.getParameter("member_age");//pay_member.getMember_age();//
		String member_job = request.getParameter("member_job");//pay_member.getMember_job();//
		String study_term = request.getParameter("study_term");//pay_member.getStudy_term();
		String phone_number = request.getParameter("phone_number");//pay_member.getPhone_number();
		String is_major = request.getParameter("is_major");//pay_member.getIs_major();
		String tested_num = request.getParameter("tested_num");//pay_member.getTested_num();
		String email = request.getParameter("email");//pay_member.getEmail();
		String is_pay = pay_member.getIs_pay(); //유료회원여부 정보
		String pay_enddate = pay_member.getPay_enddate(); //회원만기일 정보
		// 유효성 체크
		if (member_id.isEmpty() || member_pw.isEmpty() || member_name.isEmpty() || member_age.isEmpty()
				|| member_job.isEmpty() || study_term.isEmpty() || phone_number.isEmpty()
				|| tested_num.isEmpty() || email.isEmpty()) {
			request.setAttribute("error", "모든 항목을 빠짐없이 입력해주시기 바랍니다.");
			//	HttpUtil.forward(request, response, "/myInfo.jsp");
			response.sendRedirect("myInfo.do?member_id=" + member_id);
			return;
		}	
			System.out.println("upd_99"+pay_enddate);
			pay_enddate = pay_enddate.substring(0,10).replace("-", "/"); //포맷 변경
			DateFormat df = new SimpleDateFormat("YYYY/MM/dd");
			try {
				Date date = df.parse(pay_enddate);
				cal.setTime(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// VO 객체에 데이터 바인딩
			MemberVo member = new MemberVo();
			
			// 비밀번호 재설정
			if(confirm_pw == null || confirm_pw.equals("")) {
				member.setMember_pw(member_pw);
			} else {
				member.setMember_pw(confirm_pw);
			}
			
			member.setMember_id(member_id);
			
			member.setMember_name(member_name);
			member.setMember_age(member_age);
			member.setMember_job(member_job);
			member.setStudy_term(study_term);
			member.setPhone_number(phone_number);
			member.setIs_major(is_major);
			member.setTested_num(tested_num);
			member.setEmail(email);
			member.setIs_pay(is_pay); //유료회원여부
			member.setPay_enddate(df.format(cal.getTime())); //회원만기일
			// DAO 객체의 메소드 호출
			MemberDAO dao = MemberDAO.getInstance();
			dao.update(member);
			

			
			// Output View 페이지 이동\
			String path = "";
						if(session.getAttribute("check") != "A") {
							path = "/cbtPz/mypage/myInfo.do";
							response.sendRedirect(path);
						}else {
							path = "memberList.do?member_id=";
							response.sendRedirect(path + member_id);
						}
		}
		
	}

}
