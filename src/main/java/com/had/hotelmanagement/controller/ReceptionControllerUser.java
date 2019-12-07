package com.had.hotelmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.had.hotelmanagement.entity.Reception;
import com.had.hotelmanagement.service.CustomerService;
import com.had.hotelmanagement.service.ReceptionService;
import com.had.hotelmanagement.service.RoomService;
import com.had.hotelmanagement.service.ServiceService;

@Controller
@RequestMapping(value = "")

public class ReceptionControllerUser {

	@Autowired
	private ReceptionService receptionService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private ServiceService serviceService;

	@RequestMapping(value = { "/reception-list-user" }, method = RequestMethod.GET)
	public String listReception(Model model) {
		model.addAttribute("listReception", receptionService.findAll());
		return "reception-list-user";
	}

	@RequestMapping(value = "/reception-save-user", method = RequestMethod.GET)
	public String insertReception(Model model) {
		model.addAttribute("reception", new Reception());
		model.addAttribute("listCustomer", customerService.findAll());
		model.addAttribute("listRoom", roomService.findAll());
		model.addAttribute("listService", serviceService.findAll());
		return "reception-save-user";
	}

	@RequestMapping("/saveReceptionuser")
	public String doSaveReception(Reception reception, Model model) {
		receptionService.save(reception);
		model.addAttribute("listReception", receptionService.findAll());
		return "reception-list-user";
	}

	@RequestMapping("/reception-update-user/{receptionid}")
	public String updateReception(@PathVariable int receptionid, Model model) {
		Reception reception = receptionService.findById(receptionid);
		model.addAttribute("reception", reception);
		model.addAttribute("listCustomer", customerService.findAll());
		model.addAttribute("listRoom", roomService.findAll());
		model.addAttribute("listService", serviceService.findAll());
		return "reception-update-user";
	}



	@RequestMapping("/updateReceptionuser")
	public String doUpdateReception(@ModelAttribute("Reception") Reception reception, Model model) {
		receptionService.update(reception);
		model.addAttribute("listReception", receptionService.findAll());
		return "reception-list-user";
	}

	@RequestMapping("/receptionDeleteuser/{receptionid}")
	public String doDeleteReception(@PathVariable int receptionid, Model model) {
		receptionService.delete(receptionid);
		model.addAttribute("listReception", receptionService.findAll());
		return "reception-list";
	}

}
