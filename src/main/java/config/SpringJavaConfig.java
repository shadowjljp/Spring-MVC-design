package config;




import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;

@Configuration
@ComponentScan(basePackages= {"model"})
public class SpringJavaConfig {

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

//		LocalHost版
//		dataSource.setUrl("jdbc:sqlserver://localhost:1433;database=ReadShareDB");
//		dataSource.setUsername("sa");
//		dataSource.setPassword("passw0rd");
		
//		Paco版
//		dataSource.setUrl("jdbc:sqlserver://192.168.30.63:1433;database=ReadShareDB");
//		dataSource.setUsername("sa");
//		dataSource.setPassword("passw0rd");
		
//		雲端版
		dataSource.setUrl("jdbc:sqlserver://readshare.database.windows.net:1433;database=ReadShareDB");
		dataSource.setUsername("readshare");
		dataSource.setPassword("eeit@102");

		return dataSource;
	}

	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
		 builder.configure("hibernate.cfg.xml");

//		builder.addAnnotatedClasses(CustomerBean.class, ProductBean.class);

//		Properties properties = new Properties();
//		properties.put("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
//		properties.put("hibernate.current_session_context_class", "thread");
//		properties.put("hibernate.show_sql", "true");
//		builder.addProperties(properties);

		return builder.buildSessionFactory();
	}

//	@Bean
//	public MessageSource messageSource() {
//
//		ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
//		messageSource.setBasename("model.controller.Errors");
//		return messageSource;
//	}

}
