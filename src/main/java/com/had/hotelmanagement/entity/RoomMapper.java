package com.had.hotelmanagement.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RoomMapper implements RowMapper<Room> {

	public Room mapRow(ResultSet rs, int rowNum) throws SQLException {
		Room room = new Room();
		room.setRoomid(rs.getInt("roomid"));
		room.setRoomtypeid(rs.getInt("roomtypeid"));
		room.setRoomstatusid(rs.getInt("roomstatusid"));
		room.setRoomimage(rs.getString("roomimage"));
		room.setRoomdesc(rs.getString("roomdesc"));
		return room;
	}
}
