package dto;
/*
NUM		NUMBER(30,0)
PID		VARCHAR2(30 BYTE)
PPWD	VARCHAR2(30 BYTE)
PNAME	VARCHAR2(30 BYTE)
PAGE	NUMBER(10,0)
PADDR	VARCHAR2(100 BYTE)
PTEL	VARCHAR2(30 BYTE)
PJUMIN	VARCHAR2(16 BYTE)
 * */
public class MymemberDTO {
	int num,page,bday,tday;
	String pid,ppwd,pname,paddr,ptel,pjumin;
	String gender,ppernum;
	
	
	public int getTday() {
		return tday;
	}
	public void setTday(int tday) {
		this.tday = tday;
	}
	public int getBday() {
		return bday;
	}
	public void setBday(int bday) {
		this.bday = bday;
	}
	public String getPpernum() {
		return ppernum;
	}
	public void setPpernum(String ppernum) {
		this.ppernum = ppernum;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPpwd() {
		return ppwd;
	}
	public void setPpwd(String ppwd) {
		this.ppwd = ppwd;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPaddr() {
		return paddr;
	}
	public void setPaddr(String paddr) {
		this.paddr = paddr;
	}
	public String getPtel() {
		return ptel;
	}
	public void setPtel(String ptel) {
		this.ptel = ptel;
	}
	public String getPjumin() {
		return pjumin;
	}
	public void setPjumin(String pjumin) {
		this.pjumin = pjumin;
	}
	
	
}
