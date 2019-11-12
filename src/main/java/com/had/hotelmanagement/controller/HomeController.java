package com.had.hotelmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
   
	@RequestMapping(value={"/index"})
	public String index() {
		return "index";
	}
	@RequestMapping(value={"/admin"})
	public String admin() {
		return "admin";
	}
	@RequestMapping(value={"/index_user"})
	public String index_user() {
		return "index_user";
	}
	//
	@RequestMapping(value={"/about"})
	public String about() {
		return "about";
	}
	@RequestMapping(value={"/events"})
	public String events() {
		return "events";
	}
	@RequestMapping(value={"/contact"})
	public String contact() {
		return "contact";
	}
	@RequestMapping(value={"/reservation_user"})
	public String reservation() {
		return "reservation_user";
	}

	@RequestMapping(value={"/room_user"})
	public String room_user() {
		return "room_user";
	}
}
