package config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import model.AdanalysisBean;
import model.AdminBean;
import model.AdvertisementBean;
import model.AuthorBean;
import model.AuthorProductBean;
import model.BookCaseBean;
import model.FriendListBean;
import model.LogisticsBean;
import model.MemberBean;
import model.MemberProjectBean;
import model.MessageBean;
import model.OrdersBean;
import model.OrdersProductBean;
import model.ProductBean;
import model.ProjectBean;

//This configuration java file is for web application.
@Configuration
@EnableWebMvc // 小於5.0版才需要設定
@ComponentScan(basePackages = { "model", "controller", "readshare.util" })
public class SpringJavaConfigForWebSessionFactory implements WebMvcConfigurer {

	@Autowired
	ServletContext application;

	@Bean
	public DataSource dataSource() {
		System.out.println("SpringJavaConfigForWebApplication.dataSource");
		try {
			JndiObjectFactoryBean bean = new JndiObjectFactoryBean();
			bean.setJndiName("java:comp/env/jdbc/ReadShareDB");
			bean.setProxyInterface(DataSource.class);
			bean.afterPropertiesSet();
			return (DataSource) bean.getObject();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Bean
	public SessionFactory sessionFactory() {
		System.out.println("SpringJavaConfigForWebApplication.sessionFactory");
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());

		// Howard Bean
		builder.addAnnotatedClasses(AdanalysisBean.class, MessageBean.class, AdvertisementBean.class);

		// This is Paco's Bean but write by Howard for search function implemented on 2018/9/8
		builder.addAnnotatedClasses(ProductBean.class, AuthorBean.class, AuthorProductBean.class);
		
		//This is Jerry Bean
		builder.addAnnotatedClass(LogisticsBean.class);
		builder.addAnnotatedClass(OrdersProductBean.class);
		
		//Danny Bean
		builder.addAnnotatedClass(ProjectBean.class);
		builder.addAnnotatedClass(MemberProjectBean.class);
		
		//Jimmy Bean
		builder.addAnnotatedClass(FriendListBean.class);
		builder.addAnnotatedClass(MemberBean.class);
		builder.addAnnotatedClass(AdminBean.class);
		builder.addAnnotatedClass(BookCaseBean.class);
		
		//Ronnie Bean
		builder.addAnnotatedClass(OrdersBean.class);
		
		//-----------------------
		Properties properties = new Properties();
		properties.put("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
		properties.put("hibernate.current_session_context_class", "thread");
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.SQLServer2008Dialect");
		builder.addProperties(properties);

		return builder.buildSessionFactory();
	}
}
