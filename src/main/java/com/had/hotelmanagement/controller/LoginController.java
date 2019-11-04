package com.had.hotelmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.had.hotelmanagement.dao.LoginDao;
import com.had.hotelmanagement.entity.Account;

@Controller
public class LoginController {
	@Autowired
	LoginDao dao;

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String Login(Model model) {
		return "login";
	}

	@RequestMapping(value = "/xacnhan", method = RequestMethod.POST)
	public ModelAndView loginProcess(@RequestParam("username") String username,
			@RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		Account ac = new Account();
		ac.setUsername(username);
		ac.setPassword(password);
		String name = dao.xacnhan(ac);
		String user = dao.user(ac);
		if (name != null) {
			if (name.equals("admin")) {
				mv.addObject("msg", user);
				mv.setViewName("index");
			} else if (name.equals("user")) {
				mv.addObject("msg", "vui lòng đang nhập bằng quyền admin");
				mv.setViewName("login");
			} else {
				mv.addObject("msg", "vui lòng nhập lại.");
				mv.setViewName("login");
			}

		} else {
			mv.addObject("msg", "vui lòng nhập lại.");
			mv.setViewName("login");
		}

		return mv;

	}

}
