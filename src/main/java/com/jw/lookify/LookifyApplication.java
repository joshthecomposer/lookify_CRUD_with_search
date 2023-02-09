package com.jw.lookify;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
public class LookifyApplication {

	public static void main(String[] args) {
		SpringApplication.run(LookifyApplication.class, args);
	}

}
