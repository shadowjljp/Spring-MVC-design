package model;

public class MemberActivityBean {
	private Integer id;
	private Integer activeid;
	private Integer memid;
	private String memname;
	private String memphone;
	private java.util.Date fundt;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getActiveid() {
		return activeid;
	}
	public void setActiveid(Integer activeid) {
		this.activeid = activeid;
	}
	public Integer getMemid() {
		return memid;
	}
	public void setMemid(Integer memid) {
		this.memid = memid;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMemphone() {
		return memphone;
	}
	public void setMemphone(String memphone) {
		this.memphone = memphone;
	}
	public java.util.Date getFundt() {
		return fundt;
	}
	public void setFundt(java.util.Date fundt) {
		this.fundt = fundt;
	}
	
	@Override
	public String toString() {
		return "MemberActivity [id=" + id + ", activeid=" + activeid + ", memid=" + memid + ", memname=" + memname
				+ ", memphone=" + memphone + ", fundt=" + fundt + "]";
	}
	
	

}
