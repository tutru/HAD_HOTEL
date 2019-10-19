package com.had.hotelmanagement.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


public class RoomTypeMapper implements RowMapper<RoomType> {

	public RoomType mapRow(ResultSet rs, int rowNum) throws SQLException {
		RoomType roomtype = new RoomType();
		roomtype.setRoomtypeid(rs.getInt("roomtypeid"));
		roomtype.setRoomtypename(rs.getString("roomtypename"));
		roomtype.setRoomtypedesc(rs.getString("roomtypedesc"));
		roomtype.setRoomprice(rs.getDouble("roomprice"));
		return roomtype;
	}

}
