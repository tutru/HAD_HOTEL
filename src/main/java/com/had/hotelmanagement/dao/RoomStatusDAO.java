package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.had.hotelmanagement.entity.RoomStatus;
import com.had.hotelmanagement.entity.RoomStatusMapper;

@Repository
@Transactional
public class RoomStatusDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void save(RoomStatus roomstatus) {
		String sql = "INSERT INTO roomstatus (roomstatusname,roomstatusdesc) VALUES (?,?)";
		jdbcTemplate.update(sql, roomstatus.getRoomstatusname(),roomstatus.getRoomstatusdesc());
	}

	public void delete(int roomstatusid) {
		String sql = "DELETE FROM roomstatus WHERE roomstatusid = " + roomstatusid;
		jdbcTemplate.update(sql);
	}
	
	public void update(RoomStatus roomstatus) {
		String sql = "UPDATE roomstatus SET  roomstatusname = ?, roomstatusdesc=?  WHERE roomstatusid = ?";
		jdbcTemplate.update(sql, roomstatus.getRoomstatusname(),roomstatus.getRoomstatusdesc(),roomstatus.getRoomstatusid());
	}

	public RoomStatus findByIdRoomStatus(int roomstatusid) {
		String sql = "SELECT * FROM roomstatus WHERE roomstatusid = ?";
		return jdbcTemplate.queryForObject(sql, new RoomStatusMapper(), roomstatusid);
	}

	public List<RoomStatus> findAll() {
		String sql = "SELECT * FROM roomstatus";
		return jdbcTemplate.query(sql, new RoomStatusMapper());
	}

}
