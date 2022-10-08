package com.runtime.sendbug.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;

@Api(tags = "Test / 테스트")
@RestController
public class TestController {

	@GetMapping("/test")
	public String getTest() {
		return "test";
	}
}
