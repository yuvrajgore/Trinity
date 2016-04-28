package com.trinity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String welcome(){
		return "home";
	}
@RequestMapping("/home")
public String gotoHome(){
	return "home";
}
}
