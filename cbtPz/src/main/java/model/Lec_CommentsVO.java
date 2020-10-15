package model;

import lombok.Data;

@Data
public class Lec_CommentsVO {
	private String lec_comments_id;
	private String lec_comments_date;
	private String lec_comments_contents;
	private String lec_comments_poster;
	private String lecture_id;
}
