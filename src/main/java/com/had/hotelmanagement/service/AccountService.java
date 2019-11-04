package com.had.hotelmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.dao.AccountDao;
import com.had.hotelmanagement.dao.EmployeeDAO;
import com.had.hotelmanagement.dao.RoleDao;
import com.had.hotelmanagement.entity.Account;
import com.had.hotelmanagement.entity.Employee;
import com.had.hotelmanagement.entity.Role;


@Service
@Transactional
public class AccountService {
	@Autowired
	AccountDao dao ;
	@Autowired
	private EmployeeDAO employeeDAO;
	@Autowired
	private RoleDao roleDAO;
	
	public List<Account> findAll() {
		return dao.findAll();
	}

	public Account findByIdhd(int id) {
		return dao.findById(id);
	}
	
	public void save(Account account){
		// validate business
		dao.save(account);
	}
	public List<Employee> listEmployee() {
		return employeeDAO.findAll();
	}
	
	public List<Role> listRole() {
		return roleDAO.findAll();
	}

	public void update(Account account){
		// validate business
		dao.update(account);
	}
	
	public void delete(int id){
		// validate business
		dao.delete(id);
	}
	/*
	 * public List<Account> searchaccount(String username) { return
	 * dao.findaccount(username); }
	 */
}
