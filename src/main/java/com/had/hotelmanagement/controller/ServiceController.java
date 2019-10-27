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


import com.had.hotelmanagement.entity.ServiceEntity;
import com.had.hotelmanagement.service.ServiceService;

@Controller
public class ServiceController {
	@Autowired
	private ServiceService serviceService;

	@RequestMapping(value = { "/service-list" }, method = RequestMethod.GET)
	public String listservice(Model model) {
		model.addAttribute("listservice", serviceService.findAll());
		return "service-list";
	}

	@RequestMapping("/service-view/{id}")
	public String viewService(@PathVariable int id, Model model) {
		ServiceEntity service = serviceService.findByIdhd(id);
		model.addAttribute("service", service);
		return "service-view";
	}

	@RequestMapping(value = "/service-save", method = RequestMethod.GET)
	public String insertService(Model model) {
		model.addAttribute("service", new ServiceEntity());
		return "service-save";
	}

	@RequestMapping("/saveService")
	public String doSaveCustomer(ServiceEntity service, Model model) {
		serviceService.save(service);
		model.addAttribute("listservice", serviceService.findAll());
		return "service-list";
	}

	@RequestMapping("/service-update/{serviceid}")
	public String updateService(@PathVariable int serviceid, Model model) {
		ServiceEntity service = serviceService.findByIdhd(serviceid);
		model.addAttribute("service", service);
		return "service-update";
	}

	@RequestMapping("/updateService")
	public String doUpdateEmployee(@ModelAttribute("Service") ServiceEntity service, Model model) {
		serviceService.update(service);
		model.addAttribute("listservice", serviceService.findAll());
		return "service-list";
		
	}

	@RequestMapping("/serviceDelete/{serviceid}")
	public String doDeleteCustomer(@PathVariable int serviceid, Model model) {
		serviceService.delete(serviceid);
		model.addAttribute("listservice", serviceService.findAll());
		return "service-list";
	}
}
