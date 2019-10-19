package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.RoomType;
import com.had.hotelmanagement.entity.RoomTypeMapper;



@Repository
@Transactional
public class RoomTypeDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void save(RoomType roomtype) {
		String sql = "INSERT INTO roomtype (roomtypename,roomtypedesc,roomprice) VALUES (?,?,?)";
		jdbcTemplate.update(sql, roomtype.getRoomtypename(),roomtype.getRoomtypedesc(),roomtype.getRoomprice());
	}

	public void delete(int roomtypeid) {
		String sql = "DELETE FROM roomtype WHERE roomtypeid = " + roomtypeid;
		jdbcTemplate.update(sql);
	}
	
	public void update(RoomType roomtype) {
		String sql = "UPDATE roomtype SET  roomtypename = ?, roomtypedesc=? , roomprice=?  WHERE roomtypeid = ? ";
		jdbcTemplate.update(sql, roomtype.getRoomtypename(),roomtype.getRoomtypedesc(),roomtype.getRoomprice(),roomtype.getRoomtypeid());
	}

	public RoomType findByIdRoomType(int roomtypeid) {
		String sql = "SELECT * FROM roomtype WHERE roomtypeid = ?";
		return jdbcTemplate.queryForObject(sql, new RoomTypeMapper(), roomtypeid);
	}

	public List<RoomType> findAll() {
		String sql = "SELECT * FROM roomtype";
		return jdbcTemplate.query(sql, new RoomTypeMapper());
	}
	
	public List<RoomType>findRoomType(String roomtypename){
		String sql = "SELECT * FROM roomtype WHERE roomtypename LIKE '%"+roomtypename+"%'";
		return jdbcTemplate.query(sql, new RoomTypeMapper());
	}


}
