package model;

import lombok.Data;

@Data
public class ProblemVO {
	private String problem_id;
	private String subject;
	private String haeseol;
	private String problem_text;
	private String ans_1;
	private String ans_2;
	private String ans_3;
	private String ans_4;
	private String ans_correct;
	private String Paperhead_id;
	private String problem_image;
	private String solve_id;
	private String hashtag_name;
}
