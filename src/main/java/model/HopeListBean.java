package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="hopelist")
public class HopeListBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer ownerid;
	private Integer bkid;
	private java.util.Date jointime;

	@Override
	public String toString() {
		return "HopeListBean [id=" + id + ", ownerid=" + ownerid + ", bkid=" + bkid + ", jointime=" + jointime + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(Integer ownerid) {
		this.ownerid = ownerid;
	}
	public Integer getBkid() {
		return bkid;
	}
	public void setBkid(Integer bkid) {
		this.bkid = bkid;
	}
	public java.util.Date getJointime() {
		return jointime;
	}
	public void setJointime(java.util.Date jointime) {
		this.jointime = jointime;
	}
	
}
