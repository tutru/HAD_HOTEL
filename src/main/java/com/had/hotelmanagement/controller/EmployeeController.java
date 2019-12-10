package com.had.hotelmanagement.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.had.hotelmanagement.entity.Employee;
import com.had.hotelmanagement.service.AccountService;
import com.had.hotelmanagement.service.EmployeeService;

@Controller
@RequestMapping(value = "")
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private AccountService accountService;

	@RequestMapping(value = { "/employee-list" }, method = RequestMethod.GET)
	public String listEmployee(Model model) {
		model.addAttribute("listEmployee", employeeService.findAll());
		return "employee-list";
	}

	@RequestMapping("/employee-save")
	public String insertEmployee(Model model) {
		model.addAttribute("employee", new Employee());
		return "employee-save";
	}

	@RequestMapping("/employee-update/{employeeid}")
	public String updateCustomer(@PathVariable int employeeid, Model model) {
		Employee employee = employeeService.findByIdEmployee(employeeid);
		model.addAttribute("employee", employee);
		return "employee-update";
	}

	@RequestMapping(value = "/saveEmployee", method = RequestMethod.POST)
	public String doSaveEmployee(ModelMap model, HttpServletRequest request,
			@ModelAttribute("Employee") Employee employee, @RequestParam("uploadImg") MultipartFile image) {
		
			if (image.isEmpty()) {
			} else {
				try {
					String path = "E:\\study-fpoly\\datn\\HAD_HOTEL\\src\\main\\webapp\\resources\\image\\"
							+ image.getOriginalFilename();

					image.transferTo(new File(path));
					employee.setImage(image.getOriginalFilename());
					employeeService.save(employee);
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			model.addAttribute("listEmployee", employeeService.findAll());
			return "employee-list";
		
	}

	@RequestMapping("/updateEmployee")
	public String doUpdateEmployee(@ModelAttribute("Employee") Employee employee, Model model, @RequestParam("uploadImg") MultipartFile image) {
		
		if (image.isEmpty()) {
			employeeService.update(employee);
		} else {
			try {
				String path = "E:\\QUANLYDOAN\\HAD_HOTEL\\src\\main\\webapp\\resources\\image\\"
						+ image.getOriginalFilename();

				image.transferTo(new File(path));
				employee.setImage(image.getOriginalFilename());
				employeeService.update(employee);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		model.addAttribute("listEmployee", employeeService.findAll());
		return "employee-list";
	}

	@RequestMapping("/employeeDelete/{employeeid}")
	public String doDeleteCustomer(@PathVariable int employeeid, Model model) {
		try {
			employeeService.delete(employeeid);
		}catch (Exception e){
			accountService.deleteEmployee(employeeid);
			employeeService.delete(employeeid);
		}finally{
		
		model.addAttribute("listEmployee", employeeService.findAll());
		return "employee-list";
		}
	}


}
