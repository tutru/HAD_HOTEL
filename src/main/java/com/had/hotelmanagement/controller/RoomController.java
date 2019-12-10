package com.had.hotelmanagement.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.had.hotelmanagement.dao.RoomDAO;
import com.had.hotelmanagement.entity.Room;
import com.had.hotelmanagement.service.RoomService;
import com.had.hotelmanagement.service.RoomStatusService;
import com.had.hotelmanagement.service.RoomTypeService;

@Controller
@RequestMapping(value = "")
public class RoomController {
	@Autowired
	private RoomStatusService roomStatusService;
	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private RoomService roomService;
    @Autowired
    private RoomDAO dao ;
	@RequestMapping(value = { "/room-list" }, method = RequestMethod.GET)
	public String listrole(Model model) {
		model.addAttribute("listRoom", roomService.findAll());	
		return "room-list";
	}

	@RequestMapping(value = "/room-save")
	public String insertRoom(Model model) {
		model.addAttribute("room", new Room());
		model.addAttribute("listRoomType", roomService.listRoomType());
		model.addAttribute("listRoomStatus", roomService.listRoomStatus());
		return "room-save";
	}
	@RequestMapping("/room-update/{roomid}")
	public String updateRoom(@PathVariable int roomid, Model model) {
		Room room = roomService.findByIdRoom(roomid);
		model.addAttribute("room", room);
		model.addAttribute("listRoomType", roomService.listRoomType());
		model.addAttribute("listRoomStatus", roomService.listRoomStatus());
		return "room-update";
	}

	@RequestMapping(value = "/saveRoom", method = RequestMethod.POST)
	public ModelAndView doSaveRoom(ModelMap model, @ModelAttribute("room") Room room,
			@RequestParam("uploadImg") MultipartFile image, @RequestParam("roomnumber") String roomnumber) {
		
		ModelAndView mv = new ModelAndView();
		room.setRoomnumber(roomnumber);
		String a = dao.ckeckroom(room);
		
		if (a.equals("0")) {
			if (image.isEmpty()) {
				
			} else {
				try {
					String path = "E:\\study-fpoly\\datn\\HAD_HOTEL\\src\\main\\webapp\\resources\\image\\"
							+ image.getOriginalFilename();
					image.transferTo(new File(path));
					room.setRoomimage(image.getOriginalFilename());
					
					roomService.save(room);									
					model.addAttribute("listRoom", roomService.findAll());
					mv.setViewName("room-list");
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}		
		else {
			mv.setViewName("room-save");
			mv.addObject("msg", "Please enter another room number");
			model.addAttribute("listRoom", roomService.findAll());
			model.addAttribute("listRoomType", roomTypeService.findAll());
			model.addAttribute("listRoomStatus", roomStatusService.findAll());

			
		}
		
		return mv;
	}

	@RequestMapping(value = "/updateRoom", method = RequestMethod.POST)
	public String doUpdateRoom(Model model, @ModelAttribute("room") Room room,
			@RequestParam("uploadImg") MultipartFile image) {

		if (image.isEmpty()) {
			roomService.update(room);
		} else {
			try {
				String path = "E:\\study-fpoly\\datn\\HAD_HOTEL\\src\\main\\webapp\\resources\\image\\"
						+ image.getOriginalFilename();
				image.transferTo(new File(path));
				room.setRoomimage(image.getOriginalFilename());
				roomService.update(room);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		model.addAttribute("listRoom", roomService.findAll());
		return "room-list";

	}

	@SuppressWarnings("finally")
	@RequestMapping("/roomDelete/{roomid}")
	public String doDeleteRoom(@PathVariable int roomid, Model model) {
		
		try {
			roomService.delete(roomid);

		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			model.addAttribute("listRoom", roomService.findAll());
			return "room-list";
		}
		
		
	}
}
