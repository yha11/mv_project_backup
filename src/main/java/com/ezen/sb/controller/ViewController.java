package com.ezen.sb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

	@GetMapping("/views/**")
	public void goPage() {}
	

	@GetMapping("/")
	public String goHome() {
		return "views/index";
	}
}
