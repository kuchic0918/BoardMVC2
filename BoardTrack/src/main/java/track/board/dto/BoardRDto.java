package track.board.dto;

public class BoardRDto {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String writedate;
	private int replyNum;
	private int hitcount; //조회 수
	
	public BoardRDto() {	}
	public BoardRDto(int bno, String title, String content, String writer, String writedate , int replyNum,int hitcount) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writedate = writedate;
		this.replyNum = replyNum;
		this.hitcount = hitcount;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public int getReplyNum() {
		return replyNum;
		
	}
	public void setReplyNum(int replyNum) {
		this.replyNum  = replyNum;
		
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
}
