package com.had.hotelmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.had.hotelmanagement.entity.Reservation;
import com.had.hotelmanagement.service.CustomerService;
import com.had.hotelmanagement.service.ReceptionService;
import com.had.hotelmanagement.service.ReservationService;
import com.had.hotelmanagement.service.RoomService;
import com.had.hotelmanagement.service.RoomTypeService;

@Controller
@RequestMapping(value = "")
public class ReservationController {
	@Autowired
	private RoomService roomService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private ReceptionService receptionService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private RoomTypeService roomTypeService;

	@RequestMapping(value = { "/reservation-list" }, method = RequestMethod.GET)
	public String listReservation(Model model) {
		model.addAttribute("listReservation", reservationService.findAll());
		return "reservation-list";
	}

	@RequestMapping(value = "/reservation-save", method = RequestMethod.GET)
	public String insertReservation(Model model) {
		model.addAttribute("reservation", new Reservation());
		model.addAttribute("listCustomer", customerService.findAll());
		model.addAttribute("listRoomType", roomTypeService.findAll());
		model.addAttribute("listRoom", roomService.findAll());
		return "reservation-save";
	}
	@RequestMapping(value = "/reservation_user", method = RequestMethod.GET)
	public String insertReservationUser(Model model) {
		model.addAttribute("reservation", new Reservation());
		model.addAttribute("listCustomer", customerService.findAll());
		model.addAttribute("listRoomType", roomTypeService.findAll());
		model.addAttribute("listRoom", roomService.findAll());
		return "reservation_user";
	}

	@RequestMapping("/reservation-view/{reservationid}")
	public String viewReservation(@PathVariable int reservationid, Model model) {
		Reservation reservation = reservationService.findById(reservationid);
		model.addAttribute("reservation", reservation);
		return "reservation-view";
	}

	@RequestMapping("/reservation-update/{reservationid}")
	public String updateReservation(@PathVariable int reservationid, Model model) {
		Reservation reservation = reservationService.findById(reservationid);
		model.addAttribute("reservation", reservation);
		return "reservation-update";
	}

	@RequestMapping("/saveReservation")
	public String doSaveReservation(Reservation reservation, Model model) {
		reservationService.save(reservation);
		model.addAttribute("listReservation", reservationService.findAll());
		return "reservation-list";
	}
	
	@RequestMapping("/saveReservationUser")
	public String doSaveReservationUser(Reservation reservation, Model model) {
		reservationService.save(reservation);
		model.addAttribute("listReservation", reservationService.findAll());
		model.addAttribute("listRoom", roomService.findAll());
		return "reservationsuccess_user";
	}

	@RequestMapping("/updateReservation")
	public String doUpdateReservation(@ModelAttribute("Reservation") Reservation reservation, Model model) {
		reservationService.update(reservation);
		model.addAttribute("listReservation", reservationService.findAll());
		return "reservation-list";
	}

	@RequestMapping("/reservationDelete/{reservationid}")
	public String doDeleteReservation(@PathVariable int reservationid, Model model) {
		try {
			reservationService.delete(reservationid);
		} catch (Exception e) {
			receptionService.deleteRctByRstId(reservationid);
			reservationService.delete(reservationid);
		} finally {
			model.addAttribute("listReservation", reservationService.findAll());
			return "reservation-list";
		}
	}

	@RequestMapping("/findById/{reservationid}")
	public String doFindById(@PathVariable int reservationid, Model model) {
		reservationService.findById(reservationid);
		model.addAttribute("findById", reservationService.findById(reservationid));
		return "reservation-list";
	}
}
