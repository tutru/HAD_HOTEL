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

import com.had.hotelmanagement.entity.RoomStatus;
import com.had.hotelmanagement.service.RoomService;
import com.had.hotelmanagement.service.RoomStatusService;

@Controller
@RequestMapping(value = "")
public class RoomStatusController {
	@Autowired
	private RoomStatusService roomStatusService;
	@Autowired
	private RoomService roomService;

	@RequestMapping(value = { "/roomstatus-list" }, method = RequestMethod.GET)
	public String listrole(Model model) {
		model.addAttribute("listRoomStatus", roomStatusService.findAll());
		return "roomstatus-list";
	}

	@RequestMapping("/roomstatus-save")
	public String insertRoomStatus(Model model) {
		model.addAttribute("roomstatus", new RoomStatus());
		return "roomstatus-save";
	}

	@RequestMapping("/roomstatus-update/{roomstatusid}")
	public String updateRoomStatus(@PathVariable int roomstatusid, Model model) {
		RoomStatus roomstatus = roomStatusService.findByIdRoomStatus(roomstatusid);
		model.addAttribute("roomstatus", roomstatus);
		return "roomstatus-update";
	}

	@RequestMapping(value = "/saveRoomStatus", method = RequestMethod.POST)
	public String doSaveRoomStatus(ModelMap model, HttpServletRequest request,
			@ModelAttribute("roomstatus") RoomStatus roomstatus) {
		roomStatusService.save(roomstatus);
		model.addAttribute("listRoomStatus", roomStatusService.findAll());
		return "roomstatus-list";
	}

	@RequestMapping("/updateRoomStatus")
	public String doUpdateRoomStatus(Model model, @ModelAttribute("roomstatus") RoomStatus roomstatus) {
		roomStatusService.update(roomstatus);
		model.addAttribute("listRoomStatus", roomStatusService.findAll());
		return "roomstatus-list";

	}

	@RequestMapping("/roomstatus-delete/{roomstatusid}")
	public String doDeleteRoomStatus(@PathVariable int roomstatusid, Model model) {
		try {
		roomStatusService.delete(roomstatusid);
		} catch(Exception e) {
			roomService.deleteStatus(roomstatusid);
		} finally {
		model.addAttribute("listRoomStatus", roomStatusService.findAll());
		return "roomstatus-list";
		}
	}

}
