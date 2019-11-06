package com.had.hotelmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.dao.ReservationDAO;
import com.had.hotelmanagement.entity.Customer;
import com.had.hotelmanagement.entity.Reservation;

@Service
@Transactional
public class ReservationService {
	@Autowired ReservationDAO reservationDAO;
	
	public List<Reservation> findAll() {
		return reservationDAO.findAll();
	}


	public Reservation findById(int reservationid) {
		return reservationDAO.findById(reservationid);
	}
	
	public void save(Reservation reservation){
		// validate business
		reservationDAO.save(reservation);
	}

	public void update(Reservation reservation){
		// validate business
		reservationDAO.update(reservation);
	}
	
	public void delete(int reservationid){
		// validate business
		reservationDAO.delete(reservationid);
	}
}
