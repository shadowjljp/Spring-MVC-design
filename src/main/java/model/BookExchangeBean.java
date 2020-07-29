package model;

import java.util.Arrays;

public class BookExchangeBean {
	
	private Integer mem1id;
	private Integer mem2id;
	private Integer orderid;
	private String bk1isbn;
	private String bk2isbn;
	private String changebk1name;
	private String changebk2name;
	private String author1;
	@Override
	public String toString() {
		return "BookExchange [mem1id=" + mem1id + ", mem2id=" + mem2id + ", orderid=" + orderid + ", bk1isbn=" + bk1isbn
				+ ", bk2isbn=" + bk2isbn + ", changebk1name=" + changebk1name + ", changebk2name=" + changebk2name
				+ ", author1=" + author1 + ", author2=" + author2 + ", bk1intro=" + bk1intro + ", bk2intro=" + bk2intro
				+ ", bk1pic1=" + Arrays.toString(bk1pic1) + ", bk1pic2=" + Arrays.toString(bk1pic2) + ", bk1pic3="
				+ Arrays.toString(bk1pic3) + ", bk2pic1=" + Arrays.toString(bk2pic1) + ", bk2pic2="
				+ Arrays.toString(bk2pic2) + "]";
	}
	public Integer getMem1id() {
		return mem1id;
	}
	public void setMem1id(Integer mem1id) {
		this.mem1id = mem1id;
	}
	public Integer getMem2id() {
		return mem2id;
	}
	public void setMem2id(Integer mem2id) {
		this.mem2id = mem2id;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public String getBk1isbn() {
		return bk1isbn;
	}
	public void setBk1isbn(String bk1isbn) {
		this.bk1isbn = bk1isbn;
	}
	public String getBk2isbn() {
		return bk2isbn;
	}
	public void setBk2isbn(String bk2isbn) {
		this.bk2isbn = bk2isbn;
	}
	public String getChangebk1name() {
		return changebk1name;
	}
	public void setChangebk1name(String changebk1name) {
		this.changebk1name = changebk1name;
	}
	public String getChangebk2name() {
		return changebk2name;
	}
	public void setChangebk2name(String changebk2name) {
		this.changebk2name = changebk2name;
	}
	public String getAuthor1() {
		return author1;
	}
	public void setAuthor1(String author1) {
		this.author1 = author1;
	}
	public String getAuthor2() {
		return author2;
	}
	public void setAuthor2(String author2) {
		this.author2 = author2;
	}
	public String getBk1intro() {
		return bk1intro;
	}
	public void setBk1intro(String bk1intro) {
		this.bk1intro = bk1intro;
	}
	public String getBk2intro() {
		return bk2intro;
	}
	public void setBk2intro(String bk2intro) {
		this.bk2intro = bk2intro;
	}
	public byte[] getBk1pic1() {
		return bk1pic1;
	}
	public void setBk1pic1(byte[] bk1pic1) {
		this.bk1pic1 = bk1pic1;
	}
	public byte[] getBk1pic2() {
		return bk1pic2;
	}
	public void setBk1pic2(byte[] bk1pic2) {
		this.bk1pic2 = bk1pic2;
	}
	public byte[] getBk1pic3() {
		return bk1pic3;
	}
	public void setBk1pic3(byte[] bk1pic3) {
		this.bk1pic3 = bk1pic3;
	}
	public byte[] getBk2pic1() {
		return bk2pic1;
	}
	public void setBk2pic1(byte[] bk2pic1) {
		this.bk2pic1 = bk2pic1;
	}
	public byte[] getBk2pic2() {
		return bk2pic2;
	}
	public void setBk2pic2(byte[] bk2pic2) {
		this.bk2pic2 = bk2pic2;
	}
	private String author2;
	private String bk1intro;
	private String bk2intro;
	private byte[] bk1pic1;
	private byte[] bk1pic2;
	private byte[] bk1pic3;
	private byte[] bk2pic1;
	private byte[] bk2pic2;
}

