package com.ezen.sb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.sb.service.UserNormalService;

@Controller
public class AdminNomarlController {
	@Autowired
	private UserNormalService unService;
	
	@GetMapping("/normal/users")
	public String getUsers(Model model){
		model.addAttribute("list", unService.getUsers());
		return "views/user-list";
	}
}
