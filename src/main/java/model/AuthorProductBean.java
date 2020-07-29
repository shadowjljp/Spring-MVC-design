package model;

public class AuthorProductBean {
	private Integer prodid;
	private Integer authorid;
	private Integer authortype;
	@Override
	public String toString() {
		return "AuthorProductBean [prodid=" + prodid + ", authorid=" + authorid + ", authortype=" + authortype + "]";
	}
	public Integer getProdid() {
		return prodid;
	}
	public void setProdid(Integer prodid) {
		this.prodid = prodid;
	}
	public Integer getAuthorid() {
		return authorid;
	}
	public void setAuthorid(Integer authorid) {
		this.authorid = authorid;
	}
	public Integer getAuthortype() {
		return authortype;
	}
	public void setAuthortype(Integer authortype) {
		this.authortype = authortype;
	}
	
}
