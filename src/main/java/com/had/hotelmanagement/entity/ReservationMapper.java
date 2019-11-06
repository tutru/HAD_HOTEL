package com.had.hotelmanagement.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ReservationMapper implements RowMapper<Reservation>{
	
	public Reservation mapRow(ResultSet rs, int rowNum) throws SQLException {
		Reservation reservation = new Reservation();
		reservation.setReservationid(rs.getInt("reservationid"));
		reservation.setCustomerid(rs.getInt("customerid"));
		reservation.setRoomtypeid(rs.getInt("roomtypeid"));
		reservation.setExpectedcheckdate(rs.getDate("expectedcheckdate"));
		reservation.setExpectedroom(rs.getInt("expectedroom"));
		reservation.setIsdeposit(rs.getDouble("isdeposit"));
		reservation.setReservationstatus(rs.getString("reservationstatus"));
		reservation.setCustomername(rs.getString("name"));
		reservation.setRoomtypename(rs.getString("roomtypename"));
		
		return reservation;
	}
}
