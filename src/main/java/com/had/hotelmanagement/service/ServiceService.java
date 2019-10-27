package com.had.hotelmanagement.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import com.had.hotelmanagement.dao.ServiceDAO;
import com.had.hotelmanagement.entity.ServiceEntity;;
@Service
@Transactional
public class ServiceService {
	@Autowired
	private ServiceDAO serviceDAO;
	public List<ServiceEntity> findAll() {
		return serviceDAO.findAll();
	}

	public ServiceEntity findByIdhd(int id) {
		return serviceDAO.findById(id);
	}
	
	public void save(ServiceEntity service){
		// validate business
		serviceDAO.save(service);
	}

	public void update(ServiceEntity service){
		// validate business
		serviceDAO.update(service);
	}
	
	public void delete(int serviceid){
		// validate business
		serviceDAO.delete(serviceid);
	}
	public List<ServiceEntity> searchEmployee(String name) {
		return serviceDAO.findService(name);
	}
}
