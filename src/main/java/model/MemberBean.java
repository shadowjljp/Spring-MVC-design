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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="member")
@Component
public class MemberBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String memac;
	private String mempw;
	private String memname;
	private String memniname;
	private String memgen;
	private java.util.Date membirth;
	private String memphone;
	private String memadd;
	private String mememail1;
	private String mememail2;
	private java.util.Date memcd;
	private java.util.Date memllt;
	private Integer memfid;
	private Integer sis;
	private String memhl;
	private String memlv;
	private Integer memst;
	private Integer mememoney;
	private byte[] memimg;
	
	@Override
	public String toString() {
		return "memberBean [id=" + id + ", memac=" + memac + ", mempw=" + mempw + ", memname=" + memname
				+ ", memniname=" + memniname + ", memgen=" + memgen + ", membirth=" + membirth + ", memphone="
				+ memphone + ", memadd=" + memadd + ", mememail1=" + mememail1 + ", mememail2=" + mememail2 + ", memcd="
				+ memcd + ", memllt=" + memllt + ", memfid=" + memfid + ", sis=" + sis + ", memhl=" + memhl + ", memlv="
				+ memlv + ", memst=" + memst + ", mememoney=" + mememoney + ", memimg=" + Arrays.toString(memimg) + "]";
	}
	@ManyToMany
	@JoinTable(
			name="bookcase",
			joinColumns=@JoinColumn(name="ownerid"),
			inverseJoinColumns=@JoinColumn(name="bkid")
			)
	private Set<ProductBean> product;
	public Set<ProductBean> getProduct(){
		return product;
	}
	public void setProduct(Set<ProductBean> product) {
		this.product=product;
	}

	@OneToMany(
			mappedBy="member"
			)
	private Set<OrdersBean> orders;
	
	@ManyToMany
	@JoinTable(
			name="MEMBERPROJECT",
			joinColumns=@JoinColumn(name="MEMID"),
			inverseJoinColumns=@JoinColumn(name="PROJID")
			)
	private Set<ProjectBean> project;
	
	public Set<OrdersBean> getOrders() {
		return orders;
	}
	public void setOrders(Set<OrdersBean> orders) {
		this.orders = orders;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMemac() {
		return memac;
	}
	public void setMemac(String memac) {
		this.memac = memac;
	}
	public String getMempw() {
		return mempw;
	}
	public void setMempw(String mempw) {
		this.mempw = mempw;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMemniname() {
		return memniname;
	}
	public void setMemniname(String memniname) {
		this.memniname = memniname;
	}
	public String getMemgen() {
		return memgen;
	}
	public void setMemgen(String memgen) {
		this.memgen = memgen;
	}
	public java.util.Date getMembirth() {
		return membirth;
	}
	public void setMembirth(java.util.Date membirth) {
		this.membirth = membirth;
	}
	public String getMemphone() {
		return memphone;
	}
	public void setMemphone(String memphone) {
		this.memphone = memphone;
	}
	public String getMemadd() {
		return memadd;
	}
	public void setMemadd(String memadd) {
		this.memadd = memadd;
	}
	public String getMememail1() {
		return mememail1;
	}
	public void setMememail1(String mememail1) {
		this.mememail1 = mememail1;
	}
	public String getMememail2() {
		return mememail2;
	}
	public void setMememail2(String mememail2) {
		this.mememail2 = mememail2;
	}
	public java.util.Date getMemcd() {
		return memcd;
	}
	public void setMemcd(java.util.Date memcd) {
		this.memcd = memcd;
	}
	public java.util.Date getMemllt() {
		return memllt;
	}
	public void setMemllt(java.util.Date memllt) {
		this.memllt = memllt;
	}
	public Integer getMemfid() {
		return memfid;
	}
	public void setMemfid(Integer memfid) {
		this.memfid = memfid;
	}
	public Integer getSis() {
		return sis;
	}
	public void setSis(Integer sis) {
		this.sis = sis;
	}
	public String getMemhl() {
		return memhl;
	}
	public void setMemhl(String memhl) {
		this.memhl = memhl;
	}
	public String getMemlv() {
		return memlv;
	}
	public void setMemlv(String memlv) {
		this.memlv = memlv;
	}
	public Integer getMemst() {
		return memst;
	}
	public void setMemst(Integer memst) {
		this.memst = memst;
	}
	public Integer getMememoney() {
		return mememoney;
	}
	public void setMememoney(Integer mememoney) {
		this.mememoney = mememoney;
	}
	public byte[] getMemimg() {
		return memimg;
	}
	public void setMemimg(byte[] memimg) {
		this.memimg = memimg;
	}
	
}
