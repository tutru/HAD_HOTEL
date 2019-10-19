package com.had.hotelmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.dao.RoomDAO;
import com.had.hotelmanagement.dao.RoomStatusDAO;
import com.had.hotelmanagement.dao.RoomTypeDAO;
import com.had.hotelmanagement.entity.Room;
import com.had.hotelmanagement.entity.RoomStatus;
import com.had.hotelmanagement.entity.RoomType;






@Service
@Transactional
public class RoomService {
	@Autowired
	private RoomDAO roomDAO;
	@Autowired
	private RoomTypeDAO roomTypeDAO;
	@Autowired
	private RoomStatusDAO roomStatusDAO;
	
	public List<Room> findAll() {
		return roomDAO.findAll();
	}

	public Room findByIdRoom(int roomid) {
		return roomDAO.findByIdRoom(roomid);
	}
	public List<RoomType> listRoomType() {
		return roomTypeDAO.findAll();
	}
	
	public List<RoomStatus> listRoomStatus() {
		return roomStatusDAO.findAll();
	}
	
	public void save(Room room){
		// validate business
		roomDAO.save(room);
	}

	public void update(Room room){
		// validate business
		roomDAO.update(room);
	}
	
	public void delete(int roomid){
		// validate business
		roomDAO.delete(roomid);
	}
//	public List<Room> searchRoom(String roomid) {
//		return roomDAO.findRoom(roomid);
//	}


}
