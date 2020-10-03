package model;

import lombok.Data;

@Data
public class BoardVO {
	private String board_id;
	private String board_title;
	private String board_contents;
	private String member_id;
	private String board_date;
	private Integer board_views;
	private Integer first;
	private Integer last;
	private String board_file;
	private String id_rownum;
}
