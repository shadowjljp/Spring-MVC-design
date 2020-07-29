package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="customerservice")
public class CustomerServiceBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer memid;
	private Integer flag;
	private String ssort;
	private String sbl;
	private String srec;
	private java.util.Date st;
	
	@Override
	public String toString() {
		return "CustomerService [id=" + id + ", memid=" + memid + ", flag=" + flag + ", ssort=" + ssort + ", sbl=" + sbl
				+ ", srec=" + srec + ", st=" + st + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMemid() {
		return memid;
	}
	public void setMemid(Integer memid) {
		this.memid = memid;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public String getSsort() {
		return ssort;
	}
	public void setSsort(String ssort) {
		this.ssort = ssort;
	}
	public String getSbl() {
		return sbl;
	}
	public void setSbl(String sbl) {
		this.sbl = sbl;
	}
	public String getSrec() {
		return srec;
	}
	public void setSrec(String srec) {
		this.srec = srec;
	}
	public java.util.Date getSt() {
		return st;
	}
	public void setSt(java.util.Date st) {
		this.st = st;
	}

}
