package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;

@Repository
@Entity
@Table(name="adanalysis")
public class AdanalysisBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id; 
	private String page;
	private Double adclickx;
	private Double adclicky;
	private java.util.Date clicktime;
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public Double getAdclickx() {
		return adclickx;
	}
	public void setAdclickx(Double adclickx) {
		this.adclickx = adclickx;
	}
	public Double getAdclicky() {
		return adclicky;
	}
	public void setAdclicky(Double adclicky) {
		this.adclicky = adclicky;
	}
	public java.util.Date getClicktime() {
		return clicktime;
	}
	public void setClicktime(java.util.Date clicktime) {
		this.clicktime = clicktime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "AdanalysisBean [id=" + id + ", page=" + page + ", adclickx=" + adclickx + ", adclicky=" + adclicky
				+ ", clicktime=" + clicktime + "]";
	}
}
