package com.had.hotelmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value={"/"})
	public String index() {
		return "index";
	}

	@RequestMapping(value={"/dangnhap"})
	public String dangnhap() {
		return "dangnhap";
	}
}
