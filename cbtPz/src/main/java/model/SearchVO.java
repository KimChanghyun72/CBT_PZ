package model;

import lombok.Data;

@Data
public class SearchVO {
	private String paperhead_id; 
	private String subject;
	private String hashtag_name;
	private String member_id;
	private String solve_id;
	private String solve_time;
	private String check_num;
}
