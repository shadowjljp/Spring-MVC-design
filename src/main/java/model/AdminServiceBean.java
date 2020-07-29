package model;

public class AdminServiceBean {
	private Integer id;
	private Integer adminid;
	private Integer serviceid;
	@Override
	public String toString() {
		return "AdminServiceBean [id=" + id + ", adminid=" + adminid + ", serviceid=" + serviceid + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAdminid() {
		return adminid;
	}
	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}
	public Integer getServiceid() {
		return serviceid;
	}
	public void setServiceid(Integer serviceid) {
		this.serviceid = serviceid;
	}
	
}
