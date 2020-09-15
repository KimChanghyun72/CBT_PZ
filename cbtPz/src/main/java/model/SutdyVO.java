package model;

import lombok.Data;

@Data
public class SutdyVO {
	
	private String paperhead_id; 
	private String paper_date;
	private String paper_type;
	private String paper_round;
	
	private String problem_id;
	private String subject;
	private String haeseol;
	private String problem_text;
	private String ans_1;
	private String ans_2;
	private String ans_3;
	private String ans_4;
	private String ans_correct;
	private String problem_image;
	
	private String paper_id;
	private String is_correct;
	private String check_num;
	private String is_favorite;
	private String ann_order;
	
	private String classify_code_cd;
	
	private String favorite_id;
}
