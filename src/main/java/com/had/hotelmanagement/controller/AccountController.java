package com.had.hotelmanagement.controller;
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

import com.had.hotelmanagement.entity.Account;
import com.had.hotelmanagement.entity.Role;
import com.had.hotelmanagement.service.AccountService;
import com.had.hotelmanagement.service.RoleService;

@Controller
@RequestMapping("")
public class AccountController {

	@Autowired
	private AccountService service;
	private RoleService rolelist  ;

	@RequestMapping(value = "list-account",method = RequestMethod.GET)
	public String index(Model model) {
     model.addAttribute("list",service.findAll());
     return "list-account";
	}
	
	@RequestMapping("/save-account")
	public String insertaccount(Model model) {
		model.addAttribute("account", new Account());
		model.addAttribute("listEmployee", service.listEmployee());
		model.addAttribute("listRole", service.listRole());
		return "save-account";
	}

	@RequestMapping(value = "/saveaccount", method = RequestMethod.GET)
	public String doSaveaccount(ModelMap model, HttpServletRequest request, @ModelAttribute("account") Account account) {		
		service.save(account);
		model.addAttribute("list", service.findAll());
		return "list-account";
	}

	@RequestMapping("/update-account/{id}")
	public String updateaccount(@PathVariable int id, Model model) {
		Account account = service.findByIdhd(id);
		model.addAttribute("listEmployee", service.listEmployee());
		model.addAttribute("listRole", service.listRole());
		model.addAttribute("account", account);
		return "update-account";
	}
	@RequestMapping("/updateaccount")
	public String doUpdaterole(Model model,@ModelAttribute("account") Account account) {
		service.update(account);
		model.addAttribute("list", service.findAll());
		return "list-account";

	}

	@RequestMapping("/accountDelete/{id}")
	public String doDeleterole(@PathVariable int id, Model model) {
		service.delete(id);
		model.addAttribute("list", service.findAll());
		return "list-account";
	}
	
	@RequestMapping(value = "/account-search")
	public String search(String username, Model model) {
		List<Account> accounts = service.searchaccount(username);
		model.addAttribute("search", accounts);
	//	model.addAttribute("search",service.findAll());
		return "account-search";
	}
	

}
