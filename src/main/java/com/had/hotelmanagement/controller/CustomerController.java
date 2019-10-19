package com.had.hotelmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.had.hotelmanagement.service.CustomerService;


@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value={"/customerList"})
	public String listHoaDon(Model model) {
		model.addAttribute("listCustomer", customerService.findAll());
		return "customer-list";
	}
}
