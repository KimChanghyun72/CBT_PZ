package board;

public class QaBoardVO {

	//필드명
	private String qaboard_id;
	private String qaboard_contents;
	private String qaboard_date;
	private String qaboard_answer;
	private Integer qaboard_views;
	private String qaboard_type;
	private String member_id;
	
	
	//생성자
	public QaBoardVO() {}
	
	public QaBoardVO(String qaboard_id, String qaboard_contents, String qaboard_date, String qaboard_answer,

		Integer qaboard_views, String qaboard_type, String member_id) {
		super();
		this.qaboard_id = qaboard_id;
		this.qaboard_contents = qaboard_contents;
		this.qaboard_date = qaboard_date;
		this.qaboard_answer = qaboard_answer;
		this.qaboard_views = qaboard_views;
		this.qaboard_type = qaboard_type;
		this.member_id = member_id;
	}

	//메서드
	public String getQaboard_id() {
		return qaboard_id;
	}


	public void setQaboard_id(String qaboard_id) {
		this.qaboard_id = qaboard_id;
	}


	public String getQaboard_contents() {
		return qaboard_contents;
	}


	public void setQaboard_contents(String qaboard_contents) {
		this.qaboard_contents = qaboard_contents;
	}


	public String getQaboard_date() {
		return qaboard_date;
	}


	public void setQaboard_date(String qaboard_date) {
		this.qaboard_date = qaboard_date;
	}


	public String getQaboard_answer() {
		return qaboard_answer;
	}


	public void setQaboard_answer(String qaboard_answer) {
		this.qaboard_answer = qaboard_answer;
	}


	public Integer getQaboard_views() {
		return qaboard_views;
	}


	public void setQaboard_views(Integer qaboard_views) {
		this.qaboard_views = qaboard_views;
	}


	public String getQaboard_type() {
		return qaboard_type;
	}


	public void setQaboard_type(String qaboard_type) {
		this.qaboard_type = qaboard_type;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	//toString 메서드
	@Override
	public String toString() {
		return "QaBoardVO [qaboard_id=" + qaboard_id + ", qaboard_contents=" + qaboard_contents + ", qaboard_date="
				+ qaboard_date + ", qaboard_answer=" + qaboard_answer + ", qaboard_views=" + qaboard_views
				+ ", qaboard_type=" + qaboard_type + ", member_id=" + member_id + ", getQaboard_id()=" + getQaboard_id()
				+ ", getQaboard_contents()=" + getQaboard_contents() + ", getQaboard_date()=" + getQaboard_date()
				+ ", getQaboard_answer()=" + getQaboard_answer() + ", getQaboard_views()=" + getQaboard_views()
				+ ", getQaboard_type()=" + getQaboard_type() + ", getMember_id()=" + getMember_id() + "]";
	}
	
	
	
	
	
}
