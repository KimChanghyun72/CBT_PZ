package model;

import lombok.Data;

@Data
public class AdminVO {
	private String admin_id;
	private String department_cd;
	private String admin_password;
	private String admin_name;
	private String is_pay;
	private String member_id;
	private String member_pw;
	private String teacher_id;
	private String teacher_password;
}