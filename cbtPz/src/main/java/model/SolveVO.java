package model;

import lombok.Data;

@Data
public class SolveVO {
	private String solve_id;
	private String solve_score;
	private String member_id;
	private String solve_date;
	private String solve_time;
	private String solve_type_cd;
	private String solve_cnt;
	private String solve_submit;
	
	private Integer first;
	private Integer last;
}
