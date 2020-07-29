package model;

public class ActivityBean {
	private Integer id ;
	private String activesub ;
	private String activecontent ;
	private java.util.Date activestartt ;
	private java.util.Date activeendt  ;
	private String activeloc ;
	private Integer activelimit ;
	private Integer activestatus ;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getActivesub() {
		return activesub;
	}
	public void setActivesub(String activesub) {
		this.activesub = activesub;
	}
	public String getActivecontent() {
		return activecontent;
	}
	public void setActivecontent(String activecontent) {
		this.activecontent = activecontent;
	}
	public java.util.Date getActivestartt() {
		return activestartt;
	}
	public void setActivestartt(java.util.Date activestartt) {
		this.activestartt = activestartt;
	}
	public java.util.Date getActiveendt() {
		return activeendt;
	}
	public void setActiveendt(java.util.Date activeendt) {
		this.activeendt = activeendt;
	}
	public String getActiveloc() {
		return activeloc;
	}
	public void setActiveloc(String activeloc) {
		this.activeloc = activeloc;
	}
	public Integer getActivelimit() {
		return activelimit;
	}
	public void setActivelimit(Integer activelimit) {
		this.activelimit = activelimit;
	}
	public Integer getActivestatus() {
		return activestatus;
	}
	public void setActivestatus(Integer activestatus) {
		this.activestatus = activestatus;
	}
	
	@Override
	public String toString() {
		return "ActivityBean [id=" + id + ", activesub=" + activesub + ", activecontent=" + activecontent
				+ ", activestartt=" + activestartt + ", activeendt=" + activeendt + ", activeloc=" + activeloc
				+ ", activelimit=" + activelimit + ", activestatus=" + activestatus + "]";
	}
	
	
}
