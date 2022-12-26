package dto;

/*
 * NO	NUMBER
MCODE	NUMBER
MWRITER	VARCHAR2(34 BYTE)
MSUBJECT	VARCHAR2(100 BYTE)
MCONTENT	VARCHAR2(400 BYTE)
REIP	VARCHAR2(23 BYTE)
MREGDATE	DATE
 */
public class MyBoardCommDTO {
	private int no;
	private int mcode;
	private String mwriter;
	private String msubject;
	private String mcontent;
	private String reip;
	private String mregdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMcode() {
		return mcode;
	}
	public void setMcode(int mcode) {
		this.mcode = mcode;
	}
	public String getMwriter() {
		return mwriter;
	}
	public void setMwriter(String mwriter) {
		this.mwriter = mwriter;
	}
	public String getMsubject() {
		return msubject;
	}
	public void setMsubject(String msubject) {
		this.msubject = msubject;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	public String getReip() {
		return reip;
	}
	public void setReip(String reip) {
		this.reip = reip;
	}
	public String getMregdate() {
		return mregdate;
	}
	public void setMregdate(String mregdate) {
		this.mregdate = mregdate;
	}	
}
