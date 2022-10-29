package com.runtime.sendbug;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication
@MapperScan
@EnableWebMvc
public class SendbugApplication {
	private static BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

	public static void main(String[] args) {
		SpringApplication.run(SendbugApplication.class, args);
		System.out.println(bCryptPasswordEncoder.encode("test"));
	}

}
