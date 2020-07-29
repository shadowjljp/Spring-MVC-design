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

@Component
@Entity
@Table(name="AUTHOR")
public class AuthorBean {
	@ManyToMany
	@JoinTable(
			name="AUTHORPRODUCT",
			joinColumns=@JoinColumn(name="AUTHORID"),
			inverseJoinColumns=@JoinColumn(name="PRODID")
			)
	private Set<ProductBean> productBean;
	
	public Set<ProductBean> getProductBean() {
		return productBean;
	}
	public void setProductBean(Set<ProductBean> productBean) {
		this.productBean = productBean;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id ;
	private String authornamezh ;
	private String authornameen ;
	private String authorniname ;
	private String authorintro ;
	private String translintro ;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAuthornamezh() {
		return authornamezh;
	}
	public void setAuthornamezh(String authornamezh) {
		this.authornamezh = authornamezh;
	}
	public String getAuthornameen() {
		return authornameen;
	}
	public void setAuthornameen(String authornameen) {
		this.authornameen = authornameen;
	}
	public String getAuthorniname() {
		return authorniname;
	}
	public void setAuthorniname(String authorniname) {
		this.authorniname = authorniname;
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
	
	@Override
	public String toString() {
		return "authorBean [id=" + id + ", authornamezh=" + authornamezh + ", authornameen=" + authornameen
				+ ", authorniname=" + authorniname + ", authorintro=" + authorintro + ", translintro=" + translintro
				+ "]";
	}

	
	
}
