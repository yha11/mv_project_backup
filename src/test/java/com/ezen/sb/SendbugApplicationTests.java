package com.ezen.sb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SendbugApplicationTests {

	@Test
	void contextLoads() throws SQLException {
		Connection con = DriverManager.getConnection("");
		PreparedStatement pstmt = con.prepareStatement("select * from board where board_num=?");
		String boardNum = "1';drop table board;'";
		pstmt.setString(1, boardNum);
	}
	public static void main(String[] args) {

		
		String boardNum = "1';drop table board;'";
		System.out.println("select * from board where board_num='" + boardNum + "'");
	}

}
