package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Entity
@Table(name="message")
@Component
public class MessageBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer admid;
	private Integer mbid;
	private String sender;
	private String receiver;
	private String msg;
	private java.util.Date sendtime;
	private String readstate;
	
	public Integer getAdmid() {
		return admid;
	}
	public void setAdmid(Integer admid) {
		this.admid = admid;
	}
	public Integer getMbid() {
		return mbid;
	}
	public void setMbid(Integer mbid) {
		this.mbid = mbid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReadstate() {
		return readstate;
	}
	public void setReadstate(String readstate) {
		this.readstate = readstate;
	}
	public java.util.Date getSendtime() {
		return sendtime;
	}
	public void setSendtime(java.util.Date sendtime) {
		this.sendtime = sendtime;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	@Override
	public String toString() {
		return "MessageBean [id=" + id + ", admid=" + admid + ", mbid=" + mbid + ", sender=" + sender + ", receiver="
				+ receiver + ", msg=" + msg + ", sendtime=" + sendtime + ", readstate=" + readstate + "]";
	}
	
}
