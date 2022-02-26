package com.techelevator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
//@RequestMapping(path="/capstone_war_exploded")
public class HomeController {

	public HomeController(){
	}

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayHomePage() {

		return "index";
	}

	@RequestMapping(path="/error", method=RequestMethod.GET)
	public String displayErrorPage() {
		return "error";
	}
	
}
