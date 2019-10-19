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
import com.had.hotelmanagement.entity.Role;
import com.had.hotelmanagement.service.RoleService;




@Controller
@RequestMapping(value = "")
public class RoleController {
	@Autowired
	private RoleService sevice;

	@RequestMapping( value = {"/list-role" } , method = RequestMethod.GET)
	public String listrole(Model model) {
		model.addAttribute("list", sevice.findAll());
		return "list-role";
	}
	@RequestMapping("/save-role")
	public String insertRole(Model model) {
		model.addAttribute("role", new Role());
		return "save-role";
	}

	@RequestMapping(value = "/saverole", method = RequestMethod.GET)
	public String doSaveRole(ModelMap model, HttpServletRequest request, @ModelAttribute("role") Role role) {
		sevice.save(role);
		model.addAttribute("list", sevice.findAll());
		model.addAttribute("messageSuccess", "Thành Công");
		return "list-role";
	}

	@RequestMapping("/update-role/{role_id}")
	public String updatenrole(@PathVariable int role_id, Model model) {
		Role role = sevice.findByIdhd(role_id);
		model.addAttribute("role", role);
		return "update-role";
	}
	@RequestMapping("/updaterole")
	public String doUpdaterole(Model model,@ModelAttribute("role") Role role) {
		sevice.update(role);
		model.addAttribute("list", sevice.findAll());
		return "list-role";

	}

	@RequestMapping("/roleDelete/{role_id}")
	public String doDeleterole(@PathVariable int role_id, Model model) {
		sevice.delete(role_id);
		model.addAttribute("list", sevice.findAll());
		return "list-role";
	}

}