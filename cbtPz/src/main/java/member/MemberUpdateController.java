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
		
		if (pay.equals(payCheck)) {
			MemberDAO dao = new MemberDAO();
			String is_pay = "Y"; //유료회원 판단 문자
			System.out.println();
			int term2 = Integer.parseInt(term);
			
			if(is_pay.equals(pay_member.getIs_pay())) { //유료회원의 경우
				Calendar cal = Calendar.getInstance();

				String day = pay_member.getPay_enddate(); //유료회원의 만기일자 불러옴
				day = day.substring(0,10).replace("-", "/"); //포맷 변경
				DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
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
				Calendar cal = Calendar.getInstance();
				pay_member.setIs_pay(is_pay);		//유료회원으로 전환
				 cal.setTime(new Date());
				 DateFormat df = new SimpleDateFormat("yyyy/MM/dd"); 
				 cal.add(Calendar.DATE, term2);
				pay_member.setPay_enddate(df.format(cal.getTime()));
				dao.update(pay_member);
			}
			response.sendRedirect("main.jsp");
		} else {

		// Parameter 추출
		String member_id = pay_member.getMember_id();//request.getParameter("member_id");
		String member_pw = pay_member.getMember_pw();//request.getParameter("member_pw");
		String member_name = pay_member.getMember_name();//request.getParameter("member_name");
		String member_age = pay_member.getMember_age();//request.getParameter("member_age");
		String member_job = pay_member.getMember_job();//request.getParameter("member_job");
		String study_term = pay_member.getStudy_term();//request.getParameter("study_term");
		String phone_number = pay_member.getPhone_number();//request.getParameter("phone_number");
		String is_major = pay_member.getIs_major();//request.getParameter("is_major");
		String tested_num = pay_member.getTested_num();//request.getParameter("tested_num");
		String email = pay_member.getEmail();//request.getParameter("email");
		System.out.println("멤버pw"+member_pw);
		// 유효성 체크
		if (member_id.isEmpty() || member_pw.isEmpty() || member_name.isEmpty() || member_age.isEmpty()
				|| member_job.isEmpty() || study_term.isEmpty() || phone_number.isEmpty()
				|| tested_num.isEmpty() || email.isEmpty()) {
			request.setAttribute("error", "모든 항목을 빠짐없이 입력해주시기 바랍니다.");
			//	HttpUtil.forward(request, response, "/myInfo.jsp");
			response.sendRedirect("myInfo.do?member_id=" + member_id);
			return;
		}


			// VO 객체에 데이터 바인딩
			MemberVo member = new MemberVo();
			member.setMember_id(member_id);
			member.setMember_pw(member_pw);
			member.setMember_name(member_name);
			member.setMember_age(member_age);
			member.setMember_job(member_job);
			member.setStudy_term(study_term);
			member.setPhone_number(phone_number);
			member.setIs_major(is_major);
			member.setTested_num(tested_num);
			member.setEmail(email);
			// DAO 객체의 메소드 호출
			MemberDAO dao = MemberDAO.getInstance();
			dao.update(member);
			// Output View 페이지 이동\
			if(session.getAttribute("check") != "A") {
				response.sendRedirect("myInfo.do?member_id=" + member_id);
			}else {
				response.sendRedirect("memberList.do?member_id=" + member_id);
			}
		}
	}

}
