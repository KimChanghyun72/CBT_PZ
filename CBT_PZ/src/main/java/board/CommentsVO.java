package board;

public class CommentsVO {

	private String comment_id;
	private String board_id;
	private String comment_date;
	private String comment_contents;
	private String poster;
	
	
	public CommentsVO() {}
	
	public CommentsVO(String comment_id, String board_id, String comment_date, String comment_contents, String poster) {
		super();
		this.comment_id = comment_id;
		this.board_id = board_id;
		this.comment_date = comment_date;
		this.comment_contents = comment_contents;
		this.poster = poster;
	}
	
	
	
	
}
