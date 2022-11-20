package com.ezen.sb;

import java.sql.SQLException;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan
public class MovieApplication {

	public static void main(String[] args) throws SQLException {
		SpringApplication.run(MovieApplication.class, args);
	}
}
