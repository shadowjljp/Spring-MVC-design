package model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "advertisement")
public class AdvertisementBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer adtaxid;
	private String adcompany;
	private String adadd;
	private String adsales;
	private String adtel;
	private byte[] adimg;
	private Long adduration;
	private String adurl;
	private Integer clicknum;
	private Integer adrevenue;
	private Integer businesstax;
	private java.util.Date startdate;
	private java.util.Date enddate;
	private String adcat;
	private Integer zone;
	private Integer adorder;

	public Integer getAdorder() {
		return adorder;
	}

	public void setAdorder(Integer adorder) {
		this.adorder = adorder;
	}

	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAdtaxid() {
		return adtaxid;
	}

	public void setAdtaxid(Integer adtaxid) {
		this.adtaxid = adtaxid;
	}

	public String getAdcompany() {
		return adcompany;
	}

	public void setAdcompany(String adcompany) {
		this.adcompany = adcompany;
	}

	public String getAdadd() {
		return adadd;
	}

	public void setAdadd(String adadd) {
		this.adadd = adadd;
	}

	public String getAdsales() {
		return adsales;
	}

	public void setAdsales(String adsales) {
		this.adsales = adsales;
	}

	public String getAdtel() {
		return adtel;
	}

	public void setAdtel(String adtel) {
		this.adtel = adtel;
	}

	public byte[] getAdimg() {
		return adimg;
	}

	public void setAdimg(byte[] adimg) {
		this.adimg = adimg;
	}

	public Long getAdduration() {
		return adduration;
	}

	public void setAdduration(Long adduration) {
		this.adduration = adduration;
	}

	public String getAdurl() {
		return adurl;
	}

	public void setAdurl(String adurl) {
		this.adurl = adurl;
	}

	public Integer getClicknum() {
		return clicknum;
	}

	public void setClicknum(Integer clicknum) {
		this.clicknum = clicknum;
	}

	public Integer getAdrevenue() {
		return adrevenue;
	}

	public void setAdrevenue(Integer adrevenue) {
		this.adrevenue = adrevenue;
	}

	public Integer getBusinesstax() {
		return businesstax;
	}

	public void setBusinesstax(Integer businesstax) {
		this.businesstax = businesstax;
	}

	public String getAdcat() {
		return adcat;
	}

	public void setAdcat(String adcat) {
		this.adcat = adcat;
	}

	public Integer getZone() {
		return zone;
	}

	public void setZone(Integer zone) {
		this.zone = zone;
	}



	@Override
	public String toString() {
		return "AdvertisementBean [id=" + id + ", adtaxid=" + adtaxid + ", adcompany=" + adcompany + ", adadd=" + adadd
				+ ", adsales=" + adsales + ", adtel=" + adtel + ", adimg=" + adimg + ", adduration=" + adduration
				+ ", adurl=" + adurl + ", clicknum=" + clicknum + ", adrevenue=" + adrevenue + ", businesstax="
				+ businesstax + ", startdate=" + startdate + ", enddate=" + enddate + ", adcat=" + adcat + ", zone="
				+ zone + ", adorder=" + adorder + "]";
	}



	public java.util.Date getEnddate() {
		return enddate;
	}

	public void setEnddate(java.util.Date enddate) {
		this.enddate = enddate;
	}

	public java.util.Date getStartdate() {
		return startdate;
	}

	public void setStartdate(java.util.Date startdate) {
		this.startdate = startdate;
	}

}
