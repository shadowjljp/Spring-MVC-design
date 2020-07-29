package config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.core.io.Resource;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.XmlViewResolver;

import model.AdanalysisBean;
import model.AdvertisementBean;
import model.MessageBean;
import model.ProductBean;

//This configuration java file is for web application.
@Configuration
@EnableWebMvc // 小於5.0版才需要設定
@ComponentScan(basePackages = { "model", "controller", "readshare.util" })
public class SpringJavaConfigForWebApplication implements WebMvcConfigurer {

	@Autowired
	ServletContext application;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/component/**").addResourceLocations("/component/");
		registry.addResourceHandler("/developingHoward/**").addResourceLocations("/developingHoward/");
	}

	// 註冊 mvc-views.xml 邏輯名稱與實際url mapping
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		XmlViewResolver xmlViewResolver = new XmlViewResolver();

		Resource resource = new ServletContextResource(application, "/WEB-INF/mvc-views.xml");
		xmlViewResolver.setLocation(resource);
		registry.viewResolver(xmlViewResolver);
		System.out.println("SpringJavaConfiguration ----> configureViewResolvers");

	}
}
