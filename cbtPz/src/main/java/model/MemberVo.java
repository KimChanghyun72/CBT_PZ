package model;

import lombok.Data;

@Data
public class MemberVo {
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_age;
	private String member_job;
	private String study_term;
	private String phone_number;
	private String is_major;
	private String tested_num;
	private String is_pay;
	private String pay_enddate;
	private String email;
	private String teacher_password;
	private String teacher_id;
	private String cnt;
	private String board_cnt;
	private String solve_cnt;
	private String rownum;
	private String hashtag_name;
	public Object get(String string) {
		return null;
	}
}
