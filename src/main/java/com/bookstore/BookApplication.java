package com.bookstore;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@SpringBootApplication
public class BookApplication extends SpringBootServletInitializer{

	@Autowired 
	private Environment env;				// object đọc thuộc tính từ application.properties
	
	// Support for use JSP
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(BookApplication.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(BookApplication.class, args);
		
	}
	
	// Khoi tao bean de ket noi DB
	@Bean
	public DriverManagerDataSource getConnection() {
		DriverManagerDataSource datasource = new DriverManagerDataSource();
		
		datasource.setUrl(env.getProperty("jdbc.url"));
		datasource.setUsername(env.getProperty("jdbc.username"));
		datasource.setPassword(env.getProperty("jdbc.password"));
		datasource.setDriverClassName(env.getProperty("jdbc.driver"));
		
		return datasource;
		
	}	
}
