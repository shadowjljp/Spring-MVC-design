package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="admin")
@Component
public class AdminBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String admacc;
	private String admpw;
	private String admname;
	private String admniname;
	private String admgen;
	private String admtel;
	private String admadd;
	private String admemail1;
	private String admemail2;
	private java.util.Date admcd;
	private java.util.Date admllt;
	
	@Override
	public String toString() {
		return "AdminBean [id=" + id + ", admacc=" + admacc + ", admpw=" + admpw + ", admname=" + admname
				+ ", admniname=" + admniname + ", admgen=" + admgen + ", admtel=" + admtel + ", admadd=" + admadd
				+ ", admemail1=" + admemail1 + ", admemail2=" + admemail2 + ", admcd=" + admcd + ", admllt=" + admllt
				+ "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAdmacc() {
		return admacc;
	}
	public void setAdmacc(String admacc) {
		this.admacc = admacc;
	}
	public String getAdmpw() {
		return admpw;
	}
	public void setAdmpw(String admpw) {
		this.admpw = admpw;
	}
	public String getAdmname() {
		return admname;
	}
	public void setAdmname(String admname) {
		this.admname = admname;
	}
	public String getAdmniname() {
		return admniname;
	}
	public void setAdmniname(String admniname) {
		this.admniname = admniname;
	}
	public String getAdmgen() {
		return admgen;
	}
	public void setAdmgen(String admgen) {
		this.admgen = admgen;
	}
	public String getAdmtel() {
		return admtel;
	}
	public void setAdmtel(String admtel) {
		this.admtel = admtel;
	}
	public String getAdmadd() {
		return admadd;
	}
	public void setAdmadd(String admadd) {
		this.admadd = admadd;
	}
	public String getAdmemail1() {
		return admemail1;
	}
	public void setAdmemail1(String admemail1) {
		this.admemail1 = admemail1;
	}
	public String getAdmemail2() {
		return admemail2;
	}
	public void setAdmemail2(String admemail2) {
		this.admemail2 = admemail2;
	}
	public java.util.Date getAdmcd() {
		return admcd;
	}
	public void setAdmcd(java.util.Date admcd) {
		this.admcd = admcd;
	}
	public java.util.Date getAdmllt() {
		return admllt;
	}
	public void setAdmllt(java.util.Date admllt) {
		this.admllt = admllt;
	}
	
}
