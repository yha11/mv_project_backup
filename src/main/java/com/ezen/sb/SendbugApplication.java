package com.ezen.sb;

import java.sql.SQLException;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.extern.slf4j.Slf4j;

@SpringBootApplication
@MapperScan
@Slf4j
public class SendbugApplication {
	private static BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

	public static void main(String[] args) throws SQLException {
		SpringApplication.run(SendbugApplication.class, args);
		log.info("test 비밀번호 : " + bCryptPasswordEncoder.encode("test"));
	}
}
