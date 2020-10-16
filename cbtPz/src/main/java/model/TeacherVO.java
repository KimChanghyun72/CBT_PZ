package model;

import lombok.Data;

@Data
public class TeacherVO {
	private String teacher_id;
	private String teacher_password;
	private String teacher_record;
	private String teacher_picture;
	private String teacher_name;
	private String teacher_certificate;
	private String teacher_email;
	private String is_pay;
	private String member_pw;
	private String member_id;
	private String pay_enddate;
}
