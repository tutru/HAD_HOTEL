package com.had.hotelmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.had.hotelmanagement.entity.Reservation;
import com.had.hotelmanagement.service.CustomerService;
import com.had.hotelmanagement.service.ReceptionService;
import com.had.hotelmanagement.service.ReservationService;
import com.had.hotelmanagement.service.RoomTypeService;

@Controller
@RequestMapping(value = "")
public class ReservationControlleruser {
 
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private ReceptionService receptionService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private RoomTypeService roomTypeService;

	@RequestMapping(value = { "/reservation-list-user" }, method = RequestMethod.GET)
	public String listReservation(Model model) {
		model.addAttribute("listReservation", reservationService.findAll());
		return "reservation-list-user";
	}

	@RequestMapping(value = "/reservation-save-user", method = RequestMethod.GET)
	public String insertReservation(Model model) {
		model.addAttribute("reservation", new Reservation());
		model.addAttribute("listCustomer", customerService.findAll());
		model.addAttribute("listRoomType", roomTypeService.findAll());
		return "reservation-save-user";
	}

	@RequestMapping("/saveReservationuser")
	public String doSaveReservation(Reservation reservation, Model model) {
		reservationService.save(reservation);
		model.addAttribute("listReservation", reservationService.findAll());
		return "reservation-list-user";
	}

	@RequestMapping("/reservation-update-user/{reservationid}")
	public String updateReservation(@PathVariable int reservationid, Model model) {
		Reservation reservation = reservationService.findById(reservationid);
		model.addAttribute("reservation", reservation);
		return "reservation-update-user";
	}

	@RequestMapping("/updateReservationuser")
	public String doUpdateReservation(@ModelAttribute("Reservation") Reservation reservation, Model model) {
		reservationService.update(reservation);
		model.addAttribute("listReservation", reservationService.findAll());
		return "reservation-list-user";
	}

	@RequestMapping("/reservationDeleteuser/{reservationid}")
	public String doDeleteReservation(@PathVariable int reservationid, Model model) {
		try {
			reservationService.delete(reservationid);
		} catch (Exception e) {
			receptionService.deleteRctByRstId(reservationid);
			reservationService.delete(reservationid);
		} finally {
			model.addAttribute("listReservation", reservationService.findAll());
			return "reservation-list-user";
		}
	}

}
