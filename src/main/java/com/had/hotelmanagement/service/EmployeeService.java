package com.had.hotelmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.dao.EmployeeDAO;
import com.had.hotelmanagement.entity.EmployeeEntity;



@Service
@Transactional
public class EmployeeService {
	@Autowired
	private EmployeeDAO employeeDAO;
	
	public List<EmployeeEntity> findAll() {
		return employeeDAO.findAll();
	}

	public EmployeeEntity findByIdhd(int id) {
		return employeeDAO.findById(id);
	}
	
	public void save(EmployeeEntity employee){
		// validate business
		employeeDAO.save(employee);
	}

	public void update(EmployeeEntity employee){
		// validate business
		employeeDAO.update(employee);
	}
	
	public void delete(int id){
		// validate business
		employeeDAO.delete(id);
	}
	public List<EmployeeEntity> searchEmployee(String name) {
		return employeeDAO.findEmployee(name);
	}

}
