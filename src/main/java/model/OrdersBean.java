package model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Component
@Entity
@Table (name="orders")
public class OrdersBean {
	
	@ManyToOne
	@JoinColumn(
			name="memid",
			referencedColumnName="id",
			insertable=false,updatable=false
			)
	private MemberBean member;
	
	
	@ManyToMany
	@JoinTable(
			name="ordersproduct",
			joinColumns=@JoinColumn(name="orderid"),
			inverseJoinColumns=@JoinColumn(name="prodid")
			)
	private Set<ProductBean> prod;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer memid ;
	private java.util.Date orderdate ;
	private String orderstate ;
	private Integer orderamount ;
	private String paymenttype ;
	private String shippingstate ;
	private String orderticket ;
	private Integer invoicenum ;
	private String invoicename ;
	private Integer businesstax ;
	private String orderreturn ;
	private String receivername ;
	private String receiverphone ;
	private String receiveradd ;
	private String buyername;
	private String buyerphone;
	private Integer cost;

	public Set<ProductBean> getProd() {
		return prod;
	}
	public void setProd(Set<ProductBean> prod) {
		this.prod = prod;
	}
	public MemberBean getMember() {
		return member;
	}
	public void setMember(MemberBean member) {
		this.member = member;
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
	public java.util.Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(java.util.Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(String orderstate) {
		this.orderstate = orderstate;
	}
	public Integer getOrderamount() {
		return orderamount;
	}
	public void setOrderamount(Integer orderamount) {
		this.orderamount = orderamount;
	}
	public String getPaymenttype() {
		return paymenttype;
	}
	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}
	public String getShippingstate() {
		return shippingstate;
	}
	public void setShippingstate(String shippingstate) {
		this.shippingstate = shippingstate;
	}
	public String getOrderticket() {
		return orderticket;
	}
	public void setOrderticket(String orderticket) {
		this.orderticket = orderticket;
	}
	public Integer getInvoicenum() {
		return invoicenum;
	}
	public void setInvoicenum(Integer invoicenum) {
		this.invoicenum = invoicenum;
	}
	public String getInvoicename() {
		return invoicename;
	}
	public void setInvoicename(String invoicename) {
		this.invoicename = invoicename;
	}
	public Integer getBusinesstax() {
		return businesstax;
	}
	public void setBusinesstax(Integer businesstax) {
		this.businesstax = businesstax;
	}
	public String getOrderreturn() {
		return orderreturn;
	}
	public void setOrderreturn(String orderreturn) {
		this.orderreturn = orderreturn;
	}
	public String getReceivername() {
		return receivername;
	}
	public void setReceivername(String receivername) {
		this.receivername = receivername;
	}
	public String getReceiverphone() {
		return receiverphone;
	}
	public void setReceiverphone(String receiverphone) {
		this.receiverphone = receiverphone;
	}
	public String getReceiveradd() {
		return receiveradd;
	}
	public void setReceiveradd(String receiveradd) {
		this.receiveradd = receiveradd;
	}
	
	
	public Integer getCost() {
		return cost;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public String getBuyername() {
		return buyername;
	}
	public void setBuyername(String buyername) {
		this.buyername = buyername;
	}
	public String getBuyerphone() {
		return buyerphone;
	}
	public void setBuyerphone(String buyerphone) {
		this.buyerphone = buyerphone;
	}
	@Override
	public String toString() {
		return "Orders [id=" + id + ", memid=" + memid + ", orderdate=" + orderdate + ", orderstate=" + orderstate
				+ ", orderamount=" + orderamount + ", paymenttype=" + paymenttype + ", shippingstate=" + shippingstate
				+ ", orderticket=" + orderticket + ", invoicenum=" + invoicenum + ", invoicename=" + invoicename
				+ ", businesstax=" + businesstax + ", orderreturn=" + orderreturn + ", receivername=" + receivername
				+ ", receiverphone=" + receiverphone + ", receiveradd=" + receiveradd + "]";
	}
	
	
}
