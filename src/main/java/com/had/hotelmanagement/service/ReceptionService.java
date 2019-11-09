package com.had.hotelmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.dao.ReceptionDAO;
import com.had.hotelmanagement.entity.Reception;

@Service
@Transactional
public class ReceptionService {
	//hao
	@Autowired
	private ReceptionDAO receptionDAO;
	public List<Reception> findAll() {
		return receptionDAO.findAll();
	}

	public Reception findById(int receptionid) {
		return receptionDAO.findById(receptionid);
	}
	
	
	public void save(Reception reception){
		// validate business
		receptionDAO.save(reception);
	}

	public void update(Reception reception){
		// validate business
		receptionDAO.update(reception);
	}
	
	public void delete(int receptionid){
		// validate business
		receptionDAO.delete(receptionid);
	}
}
