package model;

import lombok.Data;

@Data
public class QaBoardVO {

	private Integer qaboard_id;
	private String qaboard_title; 
	private String qaboard_contents;
	private String qaboard_date;
	private String qaboard_ans;
	private Integer qaboard_views;
	private String qaboard_type_cd;
	private String member_id;
	private Integer first;
	private Integer last;
	private String comments;
	private String admin;
}
