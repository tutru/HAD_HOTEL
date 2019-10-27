package com.had.hotelmanagement.controller;

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

import com.had.hotelmanagement.entity.PaymentEntity;
import com.had.hotelmanagement.entity.ServiceEntity;
import com.had.hotelmanagement.service.CustomerService;
import com.had.hotelmanagement.service.PaymentService;
import com.had.hotelmanagement.service.ServiceService;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value={"/paymentList"},method = RequestMethod.GET)
	public String listpayment(Model model) {
		model.addAttribute("listpayment", paymentService.findAll());
		return "payment-list";
	}
	
	@RequestMapping(value = "/payment-save", method = RequestMethod.GET)
	public String insertPayment(Model model) {
		model.addAttribute("payment", new PaymentEntity());
		return "payment-save";
	}

	@RequestMapping("/savePayment")
	public String doPayment(PaymentEntity payment, Model model) {
		paymentService.save(payment);
		model.addAttribute("listpayment", paymentService.findAll());
		return "payment-list";
	}
	@RequestMapping("/payment-update/{paymentid}")
	public String updateService(@PathVariable int paymentid, Model model) {
		PaymentEntity payment = paymentService.findByIdhd(paymentid);
		model.addAttribute("payment", payment);
		return "payment-update";
	}
	@RequestMapping("/updatePdayment")
	public String doUpdateEmployee(@ModelAttribute("payment") PaymentEntity payment, Model model) {
		paymentService.update(payment);
		model.addAttribute("listpayment", paymentService.findAll());
		return "payment-list";
	}

	@RequestMapping("/paymentDelete/{paymentid}")
	public String doDeleteCustomer(@PathVariable int paymentid, Model model) {
		paymentService.delete(paymentid);
		model.addAttribute("listpayment", paymentService.findAll());
		return "payment-list";
	}
}
