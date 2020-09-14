package board;

public class CommentsVO {
	
	//필드명
	private String comment_id;
	private String board_id;
	private String comment_date;
	private String comment_contents;
	private String poster;
	
	//생성자
	public CommentsVO() {}
	
	public CommentsVO(String comment_id, String board_id, String comment_date, String comment_contents, String poster) {
		super();
		this.comment_id = comment_id;
		this.board_id = board_id;
		this.comment_date = comment_date;
		this.comment_contents = comment_contents;
		this.poster = poster;
	}

	
	//메서드
	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public String getComment_contents() {
		return comment_contents;
	}

	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	
	//toString 메서드	
	@Override
	public String toString() {
		return "CommentsVO [comment_id=" + comment_id + ", board_id=" + board_id + ", comment_date=" + comment_date
				+ ", comment_contents=" + comment_contents + ", poster=" + poster + ", getComment_id()="
				+ getComment_id() + ", getBoard_id()=" + getBoard_id() + ", getComment_date()=" + getComment_date()
				+ ", getComment_contents()=" + getComment_contents() + ", getPoster()=" + getPoster() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
}
