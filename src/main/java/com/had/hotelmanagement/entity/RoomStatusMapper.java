package com.had.hotelmanagement.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RoomStatusMapper implements RowMapper<RoomStatus> {

	public RoomStatus mapRow(ResultSet rs, int rowNum) throws SQLException {
		RoomStatus roomstatus = new RoomStatus();
		roomstatus.setRoomstatusid(rs.getInt("roomstatusid"));
		roomstatus.setRoomstatusname(rs.getString("roomstatusname"));
		roomstatus.setRoomstatusdesc(rs.getString("roomstatusdesc"));
		
		return roomstatus;
	}
}
