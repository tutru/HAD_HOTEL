package com.had.hotelmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.had.hotelmanagement.dao.AccountDao;
import com.had.hotelmanagement.entity.Account;
import com.had.hotelmanagement.service.AccountService;

@Controller
@RequestMapping("")
public class AccountController {

	@Autowired
	AccountDao dao;
	@Autowired
	private AccountService service;

	@RequestMapping(value = "list-account", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("list", service.findAll());
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
	public ModelAndView doSaveaccount(ModelMap model, @RequestParam("username") String username,
			@ModelAttribute("account") Account account) {

		ModelAndView mv = new ModelAndView();
		account.setUsername(username);
		String user = dao.ckeck(account);
		if (user.equals("0")) {
			service.save(account);
			model.addAttribute("list", service.findAll());
			mv.addObject("msg", "thành công");
			mv.setViewName("list-account");
		}

		else {

			mv.setViewName("save-account");
			mv.addObject("msg", "tài khoản có người đăng kí");
			mv.addObject("listEmployee", service.listEmployee());
			mv.addObject("listRole", service.listRole());
		}

		return mv;

	}

	@RequestMapping("/update-account/{accountid}")
	public String updateaccount(@PathVariable int accountid, Model model) {
		Account account = service.findByIdhd(accountid);
		model.addAttribute("listEmployee", service.listEmployee());
		model.addAttribute("listRole", service.listRole());
		model.addAttribute("account", account);
		return "update-account";
	}

	@RequestMapping("/updateaccount")
	public String doUpdaterole(Model model, @ModelAttribute("account") Account account) {
		service.update(account);
		model.addAttribute("list",service.findAll());
		return "list-account";

	}

	@RequestMapping("/accountDelete/{accountid}")
	public ModelAndView doDeleterole(@PathVariable int accountid) {
	ModelAndView nv =new ModelAndView();
		service.delete(accountid);
		nv.setViewName("list-account");			
		nv.addObject("list", service.findAll());	
		return nv;
	}

	/*
	 * @RequestMapping(value = "/account-search") public String search(String
	 * username, Model model) { List<Account> accounts =
	 * service.searchaccount(username); model.addAttribute("search", accounts); //
	 * model.addAttribute("search",service.findAll()); return "account-search"; }
	 */

}
