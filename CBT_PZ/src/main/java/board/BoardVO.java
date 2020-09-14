package board;

public class BoardVO {
	
	//필드명
	private String board_id;
	private String title;
	private String contents;
	private String member_id;
	private String board_date;
	private Integer views;
	
	
	//생성자
	public BoardVO() {}
	
	public BoardVO(String board_id, String title, String contents, String member_id, String board_date, Integer views) {
	
		super();
		this.board_id = board_id;
		this.title = title;
		this.contents = contents;
		this.member_id = member_id;
		this.board_date = board_date;
		this.views = views;
	}


	public String getBoard_id() {
		return board_id;
	}


	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getBoard_date() {
		return board_date;
	}


	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}


	public Integer getViews() {
		return views;
	}


	public void setViews(Integer views) {
		this.views = views;
	}


	@Override
	public String toString() {
		return "BoardVO [board_id=" + board_id + ", title=" + title + ", contents=" + contents + ", member_id="
				+ member_id + ", board_date=" + board_date + ", views=" + views + ", getBoard_id()=" + getBoard_id()
				+ ", getTitle()=" + getTitle() + ", getContents()=" + getContents() + ", getMember_id()="
				+ getMember_id() + ", getBoard_date()=" + getBoard_date() + ", getViews()=" + getViews() + "]";
	}
	
	
	
	
	
}
