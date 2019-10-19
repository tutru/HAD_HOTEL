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

import com.had.hotelmanagement.entity.Room;
import com.had.hotelmanagement.service.RoomService;



@Controller
@RequestMapping(value = "")
public class RoomController {
	
	@Autowired
	private RoomService roomService;

	@RequestMapping( value = { "/room-list" },method = RequestMethod.GET)
	public String listrole(Model model) {
		model.addAttribute("listRoom", roomService.findAll());
		return "room-list";
	}
	@RequestMapping("/room-save")
	public String insertRole(Model model) {
		model.addAttribute("room", new Room());
		model.addAttribute("listRoomType", roomService.listRoomType());
		model.addAttribute("listRoomStatus", roomService.listRoomStatus());
		return "room-save";
	}
	
	@RequestMapping("/room-view/{roomid}")
	public String viewEmployee(@PathVariable int roomid, Model model) {
		Room room = roomService.findByIdRoom(roomid);
		model.addAttribute("roomtype", room);
		return "room-view";
	}

	@RequestMapping("/room-update/{roomid}")
	public String updateCustomer(@PathVariable int roomid, Model model) {
		Room room = roomService.findByIdRoom(roomid);
		model.addAttribute("room", room);
		model.addAttribute("listRoomType", roomService.listRoomType());
		model.addAttribute("listRoomStatus", roomService.listRoomStatus());
		return "room-update";
	}

	@RequestMapping(value = "/saveRoom", method = RequestMethod.POST)
	public String doSaveRoomType(ModelMap model, HttpServletRequest request, @ModelAttribute("room") Room room) {
		roomService.save(room);
		model.addAttribute("listRoom", roomService.findAll());
		return "room-list";
	}

	@RequestMapping("/updateRoom")
	public String doUpdateRoomType(Model model,@ModelAttribute("room") Room room) {
		roomService.update(room);
		model.addAttribute("listRoom", roomService.findAll());
		return "room-list";

	}

	@RequestMapping("/roomDelete/{roomid}")
	public String doDeleteRoomType(@PathVariable int roomid, Model model) {
		roomService.delete(roomid);
		model.addAttribute("listRoom", roomService.findAll());
		return "room-list";
	}

//	@RequestMapping(value = "/employee-search")
//	public String search(String roomtypename, Model model) {
//		List<Room> roomtype =roomService.searchRoomType(roomtypename);
//		model.addAttribute("search", roomtype);
//		return "roomtype-search";
//	}



}
