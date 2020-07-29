package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="bookcase")
@Component
public class BookCaseBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer ownerid;
    private Integer bkid;
    private Integer sharedmemid;
    private java.util.Date sharetime;
    
    
	@Override
	public String toString() {
		return "BookCaseBean [id=" + id + ", ownerid=" + ownerid + ", bkid=" + bkid + ", sharedmemid=" + sharedmemid
				+ ", sharetime=" + sharetime + "]";
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
	public Integer getSharedmemid() {
		return sharedmemid;
	}
	public void setSharedmemid(Integer sharedmemid) {
		this.sharedmemid = sharedmemid;
	}
	public java.util.Date getSharetime() {
		return sharetime;
	}
	public void setSharetime(java.util.Date sharetime) {
		this.sharetime = sharetime;
	}
    
}
