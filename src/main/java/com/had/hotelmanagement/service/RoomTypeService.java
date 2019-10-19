package com.had.hotelmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.dao.RoomTypeDAO;
import com.had.hotelmanagement.entity.RoomType;



@Service
@Transactional
public class RoomTypeService {
	@Autowired
	private RoomTypeDAO roomTypeDAO;
	
	public List<RoomType> findAll() {
		return roomTypeDAO.findAll();
	}

	public RoomType findRoomType(int roomtypeid) {
		return roomTypeDAO.findByIdRoomType(roomtypeid);
	}
	
	public void save(RoomType roomtype){
		// validate business
		roomTypeDAO.save(roomtype);
	}

	public void update(RoomType roomtype){
		// validate business
		roomTypeDAO.update(roomtype);
	}
	
	public void delete(int roomtypeid){
		// validate business
		roomTypeDAO.delete(roomtypeid);
	}
	public List<RoomType> searchRoomType(String roomtypename) {
		return roomTypeDAO.findRoomType(roomtypename);
	}


}
