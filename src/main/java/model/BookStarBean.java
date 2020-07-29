package model;

//@Entity
//@Table(name="bookstar")
public class BookStarBean {
	
	private Integer prodid;
	private Integer memid;
	private Integer score;
	
	@Override
	public String toString() {
		return "BookStar [prodid=" + prodid + ", memid=" + memid + ", score=" + score + "]";
	}
	public Integer getProdid() {
		return prodid;
	}
	public void setProdid(Integer prodid) {
		this.prodid = prodid;
	}
	public Integer getMemid() {
		return memid;
	}
	public void setMemid(Integer memid) {
		this.memid = memid;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}

}

