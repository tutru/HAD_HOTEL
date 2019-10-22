package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.Room;
import com.had.hotelmanagement.entity.RoomMapper;



@Repository
@Transactional
public class RoomDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void save(Room room) {
		String sql = "INSERT INTO room (roomtypeid,roomstatusid,roomimage,roomdesc) VALUES (?,?,?,?)";
		jdbcTemplate.update(sql, room.getRoomtypeid(),room.getRoomstatusid(),room.getRoomimage(),room.getRoomdesc());
	}

	public void delete(int roomid) {
		String sql = "DELETE FROM room WHERE roomid = " + roomid;
		jdbcTemplate.update(sql);
	}
	
	public void update(Room room) {
		String sql = "UPDATE room SET  roomtypeid = ?, roomstatusid=? , roomimage=?, roomdesc=? WHERE roomid = ? ";
		jdbcTemplate.update(sql, room.getRoomtypeid(),room.getRoomstatusid(),room.getRoomimage(),room.getRoomdesc(),room.getRoomid());
	}

	public Room findByIdRoom(int roomid) {
		String sql = "SELECT * FROM room WHERE roomid = ?";
		return jdbcTemplate.queryForObject(sql, new RoomMapper(), roomid);
	}

	public List<Room> findAll() {
		String sql = "SELECT * FROM room";
		return jdbcTemplate.query(sql, new RoomMapper());
	}
	
	public List<Room>findRoom(String roomname){
		String sql = "SELECT * FROM room WHERE roomname LIKE '%"+roomname+"%'";
		return jdbcTemplate.query(sql, new RoomMapper());
	}


}
