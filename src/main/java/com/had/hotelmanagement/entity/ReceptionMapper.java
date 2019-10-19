package com.had.hotelmanagement.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ReceptionMapper implements RowMapper<Reception>{
	public Reception mapRow(ResultSet rs, int rowNum) throws SQLException {
		Reception reception = new Reception();
		reception.setReceptionid(rs.getInt("receptionid"));
		reception.setCustomerid(rs.getInt("customerid"));
		reception.setReservationid(rs.getInt("reservationid"));
		reception.setRoomid(rs.getInt("roomid"));
		reception.setCheckindate(rs.getDate("checkindate"));
		reception.setExpectedcheckindate(rs.getDate("expectedcheckindate"));
		reception.setCheckoutdate(rs.getDate("checkoutdate"));
		reception.setServiceid(rs.getInt("serviceid"));
		reception.setReservationstatus(rs.getString("reservationstatus"));
		return reception;
	}
}
