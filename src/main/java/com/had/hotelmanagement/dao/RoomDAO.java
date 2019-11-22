package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
		String sql = "INSERT INTO room (roomtypeid,roomstatusid,roomnumber,roomprice,roomimage,roomdesc) VALUES (?,?,?,?,?,?)";
		jdbcTemplate.update(sql, room.getRoomtypeid(), room.getRoomstatusid(), room.getRoomnumber(),
				room.getRoomprice(), room.getRoomimage(), room.getRoomdesc());
	}

	public void delete(int roomid) {
		String sql = "DELETE FROM room WHERE roomid = " + roomid;
		jdbcTemplate.update(sql);
	}
	
	public void deleteStatus(int roomstatusid) {
		String sql = "DELETE FROM roomstatus WHERE roomstatusid = " + roomstatusid;
		jdbcTemplate.update(sql);
	}
	
	public void deleteType(int roomtypeid) {
		String sql = "DELETE FROM roomtype WHERE roomtypeid = " + roomtypeid;
		jdbcTemplate.update(sql);
	}

	public void update(Room room) {
		String sql = "UPDATE room SET  roomtypeid = ?, roomstatusid=? , roomnumber=? , roomprice=? , roomimage=?, roomdesc=? WHERE roomid = ? ";
		jdbcTemplate.update(sql, room.getRoomtypeid(), room.getRoomstatusid(), room.getRoomnumber(),
				room.getRoomprice(), room.getRoomimage(), room.getRoomdesc(), room.getRoomid());
	}

	public Room findByIdRoom(int roomid) {
		String sql = "SELECT * FROM room WHERE roomid = ?";
		return (Room) jdbcTemplate.queryForObject(sql, new Object[] { roomid }, new BeanPropertyRowMapper(Room.class));
	}

	public List<Room> findAll() {
		String sql = "select roomid ,om.roomtypeid, us.roomstatusid, roomtypename , roomstatusname , roomnumber ,  om.roomprice , roomimage , roomdesc from roomtype ty join room om on ty.roomtypeid = om.roomtypeid join roomstatus us on us.roomstatusid = om.roomstatusid ";
		// String sql = " select * from room ";
		return jdbcTemplate.query(sql, new RoomMapper());
	}

	public String ckeckroom(Room room) {
		try {
			String sql = "select  count(*) FROM room where roomnumber = ?";
			String name = jdbcTemplate.queryForObject(sql, new Object[] { room.getRoomnumber() }, String.class);

			return name;
		} catch (Exception e) {
			return null;
		}

	}

}
