package com.ezen.sb.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TestService {

	public void sessionTest(HttpSession session) {
		log.info("login user =>{}",session.getAttribute("user"));
	}
}
