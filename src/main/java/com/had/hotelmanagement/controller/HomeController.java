package com.had.hotelmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.had.hotelmanagement.service.RoomService;

@Controller
public class HomeController {
	@Autowired
	private RoomService roomService;
	
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

	@RequestMapping(value={"/rooms_user"})
	public String room_users(Model model) {
		model.addAttribute("listRoom", roomService.findAll());
		return "rooms_user";
	}
}
