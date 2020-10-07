package model;

import lombok.Data;

@Data
public class FavoriteVO {
	private String favorite_id;
	private String paper_id;
	
	private String is_correct;
	private String check_num;
	private String is_favorite;
	private String ans_order;
	private String solve_id;
	
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
}
