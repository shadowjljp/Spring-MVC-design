package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MemberProject")
public class MemberProjectBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer memid; 
    private Integer projid;
    private Integer sponsormoney ;
    private String receivername;
    private String receiveradd;
    private String receivermail;
    private String receiverphone; 
    private java.util.Date sponsordate;
	@Override
	public String toString() {
		return "MemberProjectBean [id=" + id + ", memid=" + memid + ", projid=" + projid + ", sponsormoney="
				+ sponsormoney + ", receivername=" + receivername + ", receiveradd=" + receiveradd + ", receivermail="
				+ receivermail + ", receiverphone=" + receiverphone + ", sponsordate=" + sponsordate + "]";
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
	public Integer getProjid() {
		return projid;
	}
	public void setProjid(Integer projid) {
		this.projid = projid;
	}
	public Integer getSponsormoney() {
		return sponsormoney;
	}
	public void setSponsormoney(Integer sponsormoney) {
		this.sponsormoney = sponsormoney;
	}
	public String getReceivername() {
		return receivername;
	}
	public void setReceivername(String receivername) {
		this.receivername = receivername;
	}
	public String getReceiveradd() {
		return receiveradd;
	}
	public void setReceiveradd(String receiveradd) {
		this.receiveradd = receiveradd;
	}
	public String getReceivermail() {
		return receivermail;
	}
	public void setReceivermail(String receivermail) {
		this.receivermail = receivermail;
	}
	public String getReceiverphone() {
		return receiverphone;
	}
	public void setReceiverphone(String receiverphone) {
		this.receiverphone = receiverphone;
	}
	public java.util.Date getSponsordate() {
		return sponsordate;
	}
	public void setSponsordate(java.util.Date sponsordate) {
		this.sponsordate = sponsordate;
	}
    
}
