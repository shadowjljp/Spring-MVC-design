package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name="friendlist")
@Component
public class FriendListBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer memid;
	private Integer friendid;
	private java.util.Date jointime;
	
	@Override
	public String toString() {
		return "FriendListBean [id=" + id + ", memid=" + memid + ", friendid=" + friendid + ", jointime=" + jointime
				+ "]";
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
	public Integer getFriendid() {
		return friendid;
	}
	public void setFriendid(Integer friendid) {
		this.friendid = friendid;
	}
	public java.util.Date getJointime() {
		return jointime;
	}
	public void setJointime(java.util.Date jointime) {
		this.jointime = jointime;
	}
	
}
