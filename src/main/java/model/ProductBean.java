package model;

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

@Entity
@Table(name="PRODUCT")
@Component
public class ProductBean {
	@ManyToMany
	@JoinTable(
			name="bookcase",
			joinColumns=@JoinColumn(name="bkid"),
			inverseJoinColumns=@JoinColumn(name="ownerid")
			)
	private Set<MemberBean> member;
	public Set<MemberBean> getMember(){
		return member;
	}
	public void setMember(Set<MemberBean> member) {
		this.member=member;
	}
	@ManyToMany
	@JoinTable(
			name="ordersproduct",
			joinColumns=@JoinColumn(name="prodid"),
			inverseJoinColumns=@JoinColumn(name="orderid")
			)
	private Set<OrdersBean> orders;
	
	public Set<OrdersBean> getOrders() {
		return orders;
	}
	public void setOrders(Set<OrdersBean> orders) {
		this.orders = orders;
	}
	@ManyToMany
	@JoinTable(
			name="AUTHORPRODUCT",
			joinColumns=@JoinColumn(name="PRODID"),
			inverseJoinColumns=@JoinColumn(name="AUTHORID")
			)
	private Set<AuthorBean> authorBean;
	
	public Set<AuthorBean> getAuthorBean() {
		return authorBean;
	}
	public void setAuthorBean(Set<AuthorBean> authorBean) {
		this.authorBean = authorBean;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String bknamezh;
	private String bknameen;
	private Integer authorid;
	private Integer transid;
	private String bklang;
	private String bkpublisher;
	private java.util.Date bkpubdate;
	private String flag;
	private Integer prodstock;
	private Double prodcost;
	private Integer prodprice;
	private Double proddisc;
	private String bkisbn;
	private String bkseries;
	private Integer bkpage;
	private String bkver;
	private String bksize;
	private Integer bkwgt;
	private byte[] prodimg;
	private String bkskin;
	private String bkmenu;
	private String bkintro;
	private byte[] bkefile;
	private String authorintro;
	private String translintro;
	private Integer classid;
	private Double bkstar;
	private Integer showorder;
	
	
	
	@Override
	public String toString() {
		return "ProductBean [authorBean=" + authorBean + ", id=" + id + ", bknamezh=" + bknamezh + ", bknameen="
				+ bknameen + ", authorid=" + authorid + ", transid=" + transid + ", bklang=" + bklang + ", bkpublisher="
				+ bkpublisher + ", bkpubdate=" + bkpubdate + ", flag=" + flag + ", prodstock=" + prodstock
				+ ", prodcost=" + prodcost + ", prodprice=" + prodprice + ", proddisc=" + proddisc + ", bkisbn="
				+ bkisbn + ", bkseries=" + bkseries + ", bkpage=" + bkpage + ", bkver=" + bkver + ", bksize=" + bksize
				+ ", bkwgt=" + bkwgt + ", prodimg=" + /*Arrays.toString(prodimg) + */", bkskin=" + bkskin + ", bkmenu="
				+ bkmenu + ", bkintro=" + bkintro + ", bkefile=" + bkefile + ", authorintro=" + authorintro
				+ ", translintro=" + translintro + ", classid=" + classid + ", bkstar=" + bkstar + "]";
	}
	public Integer getShoworder() {
		return showorder;
	}
	public void setShoworder(Integer showorder) {
		this.showorder = showorder;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBknamezh() {
		return bknamezh;
	}
	public void setBknamezh(String bknamezh) {
		this.bknamezh = bknamezh;
	}
	public String getBknameen() {
		return bknameen;
	}
	public void setBknameen(String bknameen) {
		this.bknameen = bknameen;
	}
	public Integer getAuthorid() {
		return authorid;
	}
	public void setAuthorid(Integer authorid) {
		this.authorid = authorid;
	}
	public Integer getTransid() {
		return transid;
	}
	public void setTransid(Integer transid) {
		this.transid = transid;
	}
	public String getBklang() {
		return bklang;
	}
	public void setBklang(String bklang) {
		this.bklang = bklang;
	}
	public String getBkpublisher() {
		return bkpublisher;
	}
	public void setBkpublisher(String bkpublisher) {
		this.bkpublisher = bkpublisher;
	}
	public java.util.Date getBkpubdate() {
		return bkpubdate;
	}
	public void setBkpubdate(java.util.Date bkpubdate) {
		this.bkpubdate = bkpubdate;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public Integer getProdstock() {
		return prodstock;
	}
	public void setProdstock(Integer prodstock) {
		this.prodstock = prodstock;
	}
	public Double getProdcost() {
		return prodcost;
	}
	public void setProdcost(Double prodcost) {
		this.prodcost = prodcost;
	}
	public Integer getProdprice() {
		return prodprice;
	}
	public void setProdprice(Integer prodprice) {
		this.prodprice = prodprice;
	}
	public Double getProddisc() {
		return proddisc;
	}
	public void setProddisc(Double proddisc) {
		this.proddisc = proddisc;
	}
	public String getBkisbn() {
		return bkisbn;
	}
	public void setBkisbn(String bkisbn) {
		this.bkisbn = bkisbn;
	}
	public String getBkseries() {
		return bkseries;
	}
	public void setBkseries(String bkseries) {
		this.bkseries = bkseries;
	}
	public Integer getBkpage() {
		return bkpage;
	}
	public void setBkpage(Integer bkpage) {
		this.bkpage = bkpage;
	}
	public String getBkver() {
		return bkver;
	}
	public void setBkver(String bkver) {
		this.bkver = bkver;
	}
	public String getBksize() {
		return bksize;
	}
	public void setBksize(String bksize) {
		this.bksize = bksize;
	}
	public Integer getBkwgt() {
		return bkwgt;
	}
	public void setBkwgt(Integer bkwgt) {
		this.bkwgt = bkwgt;
	}
	public byte[] getProdimg() {
		return prodimg;
	}
	public void setProdimg(byte[] prodimg) {
		this.prodimg = prodimg;
	}
	public String getBkskin() {
		return bkskin;
	}
	public void setBkskin(String bkskin) {
		this.bkskin = bkskin;
	}
	public String getBkmenu() {
		return bkmenu;
	}
	public void setBkmenu(String bkmenu) {
		this.bkmenu = bkmenu;
	}
	public String getBkintro() {
		return bkintro;
	}
	public void setBkintro(String bkintro) {
		this.bkintro = bkintro;
	}

	public byte[] getBkefile() {
		return bkefile;
	}

	public void setBkefile(byte[] bkefile) {
		this.bkefile = bkefile;
	}
	public String getAuthorintro() {
		return authorintro;
	}
	public void setAuthorintro(String authorintro) {
		this.authorintro = authorintro;
	}
	public String getTranslintro() {
		return translintro;
	}
	public void setTranslintro(String translintro) {
		this.translintro = translintro;
	}
	public Integer getClassid() {
		return classid;
	}
	public void setClassid(Integer classid) {
		this.classid = classid;
	}
	public Double getBkstar() {
		return bkstar;
	}
	public void setBkstar(Double bkstar) {
		this.bkstar = bkstar;
	}
	
	
}
