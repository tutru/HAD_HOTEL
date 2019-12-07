package com.had.hotelmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.had.hotelmanagement.entity.PaymentEntity;
import com.had.hotelmanagement.service.PaymentService;

@Controller
public class paymentControllerUser {
	@Autowired
	private PaymentService paymentService;
 
	@RequestMapping(value = { "/payment-list-user" }, method = RequestMethod.GET)
	public String listpayment(Model model) {
		model.addAttribute("listpayment", paymentService.findAll());
		return "payment-list-user";
	}

	@RequestMapping(value = "/payment-save-user", method = RequestMethod.GET)
	public String insertPayment(Model model) {
		model.addAttribute("payment", new PaymentEntity());
		model.addAttribute("listPaymentType", paymentService.listPaymentType());
		model.addAttribute("listReception", paymentService.listReception());
		return "payment-save-user";
	}

	@RequestMapping("/savePaymentuser")
	public String doPayment(PaymentEntity payment, Model model) {
		paymentService.save(payment);
		model.addAttribute("listpayment", paymentService.findAll());
		return "payment-list-user";
	}

	@RequestMapping("/payment-update-user/{paymentid}")
	public String updateService(@PathVariable int paymentid, Model model) {
		PaymentEntity payment = paymentService.findByIdhd(paymentid);
		model.addAttribute("payment", payment);
		return "payment-update-user";
	}

	@RequestMapping("/updatePaymentuser")
	public String doUpdateEmployee(@ModelAttribute("payment") PaymentEntity payment, Model model) {
		paymentService.update(payment);
		model.addAttribute("listpayment", paymentService.findAll());
		return "payment-list-user";
	}

	@RequestMapping("/paymentDeleteuser/{paymentid}")
	public String doDeleteCustomer(@PathVariable int paymentid, Model model) {
		paymentService.delete(paymentid);
		model.addAttribute("listpayment", paymentService.findAll());
		return "payment-list-user";
	}
}
