package com.had.hotelmanagement.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.had.hotelmanagement.entity.Customer;
import com.had.hotelmanagement.service.CustomerService;


@Controller
@RequestMapping(value = "")
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value={"/customer-list"},method = RequestMethod.GET)
	public String listCustomer(Model model) {
		model.addAttribute("listCustomer", customerService.findAll());
		return "customer-list";
	}
	@RequestMapping(value = "/customer-save", method = RequestMethod.GET)
	public String insertHoaDon(Model model) {
		model.addAttribute("customer", new Customer());
		return "customer-save";
	}
	
	@RequestMapping("/customer-view/{customerid}")
	public String viewCustomer(@PathVariable int customerid, Model model) {
		Customer customer = customerService.findById(customerid);
		model.addAttribute("customer", customer);
		return "customer-view";
	}
	
	@RequestMapping("/customer-update/{customerid}")
	public String updateCustomer(@PathVariable int customerid, Model model) {
		Customer customer = customerService.findById(customerid);
		model.addAttribute("customer", customer);
		return "customer-update";
	}

	@RequestMapping("/saveCustomer")
	public String doSaveCustomer(Customer customer , Model model) {
		customerService.save(customer);
		model.addAttribute("listCustomer", customerService.findAll());
		return "customer-list";
	}

	@RequestMapping("/updateCustomer")
	public String doUpdateCustomer(@ModelAttribute("Customer") Customer customer, Model model) {
		customerService.update(customer);
		model.addAttribute("listCustomer", customerService.findAll());
		return "customer-list";
	}
	
	@RequestMapping("/customerDelete/{customerid}")
	public String doDeleteCustomer(@PathVariable int customerid, Model model) {
		customerService.delete(customerid);
		model.addAttribute("listCustomer", customerService.findAll());
		return "customer-list";
	}
	
	@RequestMapping("/findById/{customerid}")
	public String doFindById(@PathVariable int customerid, Model model) {
		customerService.findById(customerid);
		model.addAttribute("findById", customerService.findById(customerid));
		return "customer-list";
	}
	
//	@RequestMapping(value={"/finHoaDon/{tenkh}"})
//	public String findHoaDon(@PathVariable String tenkh, Model model) {
//		model.addAttribute("findHoaDon", hoaDonService.findHoaDon(tenkh));
//		return "hoadon-list";
//	}
}
