package model;

import lombok.Data;

@Data
public class LearnVO {
	private String learn_id;
	private String member_id;
	private String lecture_id;
	private String lecture_name;
	private String lecture_info;
	private String lecture_level;
	private String lecture_subject;
	private String lecture_image;
	private String lecture_link;
	private String cnts;
	private String lecture_on;
}
