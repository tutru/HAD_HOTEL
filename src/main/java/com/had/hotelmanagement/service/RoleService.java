package com.had.hotelmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.dao.RoleDao;
import com.had.hotelmanagement.entity.Role;

@Service
@Transactional
public class RoleService {
	@Autowired
	RoleDao dao ;
	public List<Role> findAll() {
		return dao.findAll();
	}

	public Role findByIdhd(int roleid) {
		return dao.findById(roleid);
	}
	
	public void save(Role role){
		// validate business
		dao.save(role);
	}

	public void update(Role role){
		// validate business
		dao.update(role);
	}
	
	public void delete(int roleid){
		// validate business
		dao.delete(roleid);
	}
	
//	public List<Role> searchnhanvien(String tennv) {
//		return dao.findnhanvienten(tennv);
//	}
}
