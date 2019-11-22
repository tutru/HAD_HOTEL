package com.had.hotelmanagement.controller;

import java.io.File;

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
import com.had.hotelmanagement.service.ReceptionService;
import com.had.hotelmanagement.service.ReservationService;

@Controller
@RequestMapping(value = "")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private ReceptionService receptionService;

	@RequestMapping(value = { "/customer-list" }, method = RequestMethod.GET)
	public String listCustomer(Model model) {
		model.addAttribute("listCustomer", customerService.findAll());
		return "customer-list";
	}

	@RequestMapping(value = "/customer-save")
	public String insertCustomer(Model model) {
		model.addAttribute("customer", new Customer());
		return "customer-save";
	}

	@RequestMapping("/customer-update/{customerid}")
	public String updateCustomer(@PathVariable int customerid, Model model) {
		Customer customer = customerService.findById(customerid);
		model.addAttribute("customer", customer);
		return "customer-update";
	}

	@RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
	public String doSaveCustomer(ModelMap model, HttpServletRequest request,
			@ModelAttribute("customer") Customer customer, @RequestParam("uploadImg") MultipartFile image) {

		if (image.isEmpty()) {
		} else {
			try {
				String path = "E:\\study-fpoly\\datn\\HAD_HOTEL\\src\\main\\webapp\\resources\\image\\"
						+ image.getOriginalFilename();

				image.transferTo(new File(path));
				customer.setImage(image.getOriginalFilename());
				customerService.save(customer);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		model.addAttribute("listCustomer", customerService.findAll());
		return "customer-list";
	}

	@RequestMapping("/updateCustomer")
	public String doupdateCustomer(ModelMap model, @ModelAttribute("customer") Customer customer,
			@RequestParam("uploadImg") MultipartFile image) {
		if (image.isEmpty()) {
		} else {
			try {
				String path = "E:\\study-fpoly\\datn\\HAD_HOTEL\\src\\main\\webapp\\resources\\image\\"
						+ image.getOriginalFilename();

				image.transferTo(new File(path));
				customer.setImage(image.getOriginalFilename());
				customerService.update(customer);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		model.addAttribute("listCustomer", customerService.findAll());
		return "customer-list";
	}

	@RequestMapping(value = "/customerDelete/{customerid}", method = RequestMethod.GET)
	public String doDeleteCustomer(@PathVariable int customerid, Model model) {
		try {
			customerService.delete(customerid);
		} catch (Exception e) {
			reservationService.deleteRstByCtmId(customerid);
			receptionService.deleteRctByCtmId(customerid);
		} finally {
			customerService.delete(customerid);
			model.addAttribute("listCustomer", customerService.findAll());
			return "customer-list";
		}
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
