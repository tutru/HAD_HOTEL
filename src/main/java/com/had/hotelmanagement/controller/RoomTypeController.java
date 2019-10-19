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


import com.had.hotelmanagement.entity.RoomType;
import com.had.hotelmanagement.service.RoomTypeService;




@Controller
@RequestMapping(value = "")
public class RoomTypeController {
	@Autowired
	private RoomTypeService roomTypeService;

	@RequestMapping( value = { "/roomtype-list" },method = RequestMethod.GET)
	public String listrole(Model model) {
		model.addAttribute("listRoomType", roomTypeService.findAll());
		return "roomtype-list";
	}
	@RequestMapping("/roomtype-save")
	public String insertRole(Model model) {
		model.addAttribute("roomtype", new RoomType());
		return "roomtype-save";
	}
	
	@RequestMapping("/roomtype-view/{roomtypeid}")
	public String viewEmployee(@PathVariable int roomtypeid, Model model) {
		RoomType roomtype = roomTypeService.findRoomType(roomtypeid);
		model.addAttribute("roomtype", roomtype);
		return "roomtype-view";
	}

	@RequestMapping("/roomtype-update/{roomtypeid}")
	public String updateCustomer(@PathVariable int roomtypeid, Model model) {
		RoomType roomtype = roomTypeService.findRoomType(roomtypeid);
		model.addAttribute("roomtype", roomtype);
		return "roomtype-update";
	}

	@RequestMapping(value = "/saveRoomType", method = RequestMethod.POST)
	public String doSaveRoomType(ModelMap model, HttpServletRequest request, @ModelAttribute("roomtype") RoomType roomtype) {
		roomTypeService.save(roomtype);
		model.addAttribute("listRoomType", roomTypeService.findAll());
		return "roomtype-list";
	}

	@RequestMapping("/updateRoomType")
	public String doUpdateRoomType(Model model,@ModelAttribute("roomtype") RoomType roomtype) {
		roomTypeService.update(roomtype);
		model.addAttribute("listRoomType", roomTypeService.findAll());
		return "roomtype-list";

	}

	@RequestMapping(value ="/roomtypeDelete/{roomtypeid}")
	public String doDeleteRoomType(@PathVariable int roomtypeid, Model model) {
		roomTypeService.delete(roomtypeid);
		model.addAttribute("listRoomType", roomTypeService.findAll());
		return "roomtype-list";
	}

	@RequestMapping(value = "/roomtype-search")
	public String search(String roomtypename, Model model) {
		List<RoomType> roomtype =roomTypeService.searchRoomType(roomtypename);
		model.addAttribute("search", roomtype);
		return "roomtype-search";
	}



}
