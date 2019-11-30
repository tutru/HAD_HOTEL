package com.had.hotelmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.had.hotelmanagement.entity.PaymentTypeEntity;
import com.had.hotelmanagement.entity.ServiceEntity;
import com.had.hotelmanagement.service.PaymentTypeEntityService;
import com.had.hotelmanagement.service.ReceptionService;
import com.had.hotelmanagement.service.ServiceService;
@Controller
public class PaymentTypeController {
	@Autowired
	private PaymentTypeEntityService paymentTypeEntityService;
	@Autowired
	private ReceptionService receptionService;
	
	@RequestMapping(value={"/paymenttype-list"},method = RequestMethod.GET)
	public String listpaymenttype(Model model) {
		model.addAttribute("listpaymenttype", paymentTypeEntityService.findAll());
		return "paymenttype-list";
	}
	@RequestMapping("/paymenttype-view/{id}")
	public String viewService(@PathVariable int id, Model model) {
		PaymentTypeEntity paymenttype = paymentTypeEntityService.findByIdhd(id);
		model.addAttribute("listpaymenttype", paymenttype);
		return "paymenttype-view";
	}


	@RequestMapping(value = "/paymenttype-save", method = RequestMethod.GET)
	public String insertService(Model model) {
		model.addAttribute("payment", new PaymentTypeEntity());
		return "paymenttype-save";
	}

	@RequestMapping("/savePaymenttype")
	public String doSaveCustomer(PaymentTypeEntity payment, Model model) {
		paymentTypeEntityService.save(payment);
		model.addAttribute("listpaymenttype", paymentTypeEntityService.findAll());
		return "paymenttype-list";
	}

	@RequestMapping("/paymenttype-update/{id}")
	public String updateService(@PathVariable int id, Model model) {
		PaymentTypeEntity paymenttype = paymentTypeEntityService.findByIdhd(id);
		model.addAttribute("payment", paymenttype);
		return "paymenttype-update";
	}
	@RequestMapping("/updatepaymenttype")
	public String doUpdateEmployee(@ModelAttribute("payment") PaymentTypeEntity payment, Model model) {
		paymentTypeEntityService.update(payment);
		model.addAttribute("listpaymenttype", paymentTypeEntityService.findAll());
		return "paymenttype-list";
	}

//	@RequestMapping("/paymenttypeDelete/{paymenttypeid}")
//	public String doDeleteCustomer(@PathVariable int paymenttypeid, Model model) {
//		paymentTypeEntityService.delete(paymenttypeid);
//		model.addAttribute("listpaymenttype", paymentTypeEntityService.findAll());
//		return "paymenttype-list";
//	}
	@RequestMapping(value = "/paymenttypeDelete/{paymenttypeid}", method = RequestMethod.GET)
	public String doDeletePaymentType(@PathVariable int paymenttypeid, Model model) {
		try {
			paymentTypeEntityService.delete(paymenttypeid);
		} catch (Exception e) {
			paymentTypeEntityService.deletepayment(paymenttypeid);
			paymentTypeEntityService.delete(paymenttypeid);
			paymentTypeEntityService.deletepaymentt(paymenttypeid);
		} finally {
			model.addAttribute("listpaymenttype", paymentTypeEntityService.findAll());
			return "paymenttype-list";
		}
	}
}
