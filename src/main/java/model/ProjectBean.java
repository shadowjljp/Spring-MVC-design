package model;

import java.util.Arrays;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="project")
public class ProjectBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer memid;
	private java.util.Date projt;
	private java.util.Date projstartt;
	private java.util.Date projendt;
	private String projcontent;
	private String projname;
	private Integer projbdg;
	private String projplan1;
	private Integer projplan1price;
	private Integer projplan1num; 
	private String projplan2; 
	private Integer projplan2price;
	private Integer projplan2num;
	private String projplan3;
	private Integer projplan3price;
	private Integer projplan3num; 
	private String projytube;
	private String projstatus;
	private byte[] projimg;
	
	@ManyToMany
	@JoinTable(
			name="MEMBERPROJECT",
			joinColumns=@JoinColumn(name="PROJID"),
			inverseJoinColumns=@JoinColumn(name="MEMID")
			)
	private Set<MemberBean> member;
	
	@Override
	public String toString() {
		return "ProjectBean [id=" + id + ", memid=" + memid + ", projt=" + projt + ", projstartt=" + projstartt
				+ ", projendt=" + projendt + ", projcontent=" + projcontent + ", projname=" + projname + ", projbdg="
				+ projbdg + ", projplan1=" + projplan1 + ", projplan1price=" + projplan1price + ", projplan1num="
				+ projplan1num + ", projplan2=" + projplan2 + ", projplan2price=" + projplan2price + ", projplan2num="
				+ projplan2num + ", projplan3=" + projplan3 + ", projplan3price=" + projplan3price + ", projplan3num="
				+ projplan3num + ", projytube=" + projytube + ", projstatus=" + projstatus + /*", projimg="
				+ Arrays.toString(projimg) +*/ "]";
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
	public java.util.Date getProjt() {
		return projt;
	}
	public void setProjt(java.util.Date projt) {
		this.projt = projt;
	}
	public java.util.Date getProjstartt() {
		return projstartt;
	}
	public void setProjstartt(java.util.Date projstartt) {
		this.projstartt = projstartt;
	}
	public java.util.Date getProjendt() {
		return projendt;
	}
	public void setProjendt(java.util.Date projendt) {
		this.projendt = projendt;
	}
	public String getProjcontent() {
		return projcontent;
	}
	public void setProjcontent(String projcontent) {
		this.projcontent = projcontent;
	}
	public String getProjname() {
		return projname;
	}
	public void setProjname(String projname) {
		this.projname = projname;
	}
	public Integer getProjbdg() {
		return projbdg;
	}
	public void setProjbdg(Integer projbdg) {
		this.projbdg = projbdg;
	}
	public String getProjplan1() {
		return projplan1;
	}
	public void setProjplan1(String projplan1) {
		this.projplan1 = projplan1;
	}
	public Integer getProjplan1price() {
		return projplan1price;
	}
	public void setProjplan1price(Integer projplan1price) {
		this.projplan1price = projplan1price;
	}
	public Integer getProjplan1num() {
		return projplan1num;
	}
	public void setProjplan1num(Integer projplan1num) {
		this.projplan1num = projplan1num;
	}
	public String getProjplan2() {
		return projplan2;
	}
	public void setProjplan2(String projplan2) {
		this.projplan2 = projplan2;
	}
	public Integer getProjplan2price() {
		return projplan2price;
	}
	public void setProjplan2price(Integer projplan2price) {
		this.projplan2price = projplan2price;
	}
	public Integer getProjplan2num() {
		return projplan2num;
	}
	public void setProjplan2num(Integer projplan2num) {
		this.projplan2num = projplan2num;
	}
	public String getProjplan3() {
		return projplan3;
	}
	public void setProjplan3(String projplan3) {
		this.projplan3 = projplan3;
	}
	public Integer getProjplan3price() {
		return projplan3price;
	}
	public void setProjplan3price(Integer projplan3price) {
		this.projplan3price = projplan3price;
	}
	public Integer getProjplan3num() {
		return projplan3num;
	}
	public void setProjplan3num(Integer projplan3num) {
		this.projplan3num = projplan3num;
	}
	public String getProjytube() {
		return projytube;
	}
	public void setProjytube(String projytube) {
		this.projytube = projytube;
	}
	public String getProjstatus() {
		return projstatus;
	}
	public void setProjstatus(String projstatus) {
		this.projstatus = projstatus;
	}
	public byte[] getProjimg() {
		return projimg;
	}
	public void setProjimg(byte[] projimg) {
		this.projimg = projimg;
	}
	
	
}


