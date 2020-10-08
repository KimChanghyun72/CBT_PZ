package model;

import lombok.Data;

@Data
public class LectureVO {
	private String lecture_id;
	private String teacher_id;
	private String lecture_info;
	private String lecture_level;
	private String lecture_subject;
	private String lecture_image;
	private String lecture_name;
	private String lecture_link;
	private String teacher_name;
	private String lecture_yn;
	private String member_id;
}
