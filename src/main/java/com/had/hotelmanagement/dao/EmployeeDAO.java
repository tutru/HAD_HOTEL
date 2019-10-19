package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.EmployeeEntity;
import com.had.hotelmanagement.entity.EmployeeMapper;



@Repository
@Transactional
public class EmployeeDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void save(EmployeeEntity employee) {
		String sql = "INSERT INTO EMPLOYEE (EMPLOYEE_NAME,EMPLOYEE_BIRTHDAY,GOVERNMENT_ID,EMPLOYEE_PHONE,EMPLOYEE_EMAIL,EMPLOYEE_ADDRESS,EMPLOYEE_IMAGE,EMPLOYEE_SALARY) VALUES (?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, employee.getName(),employee.getBirthday(),
				employee.getGovernmentid(),employee.getPhone(),employee.getEmail(),employee.getAddress(),employee.getImage(),employee.getSalary());
	}

	public void delete(int id) {
		String sql = "DELETE FROM EMPLOYEE WHERE EMPLOYEE_ID = " + id;
		jdbcTemplate.update(sql);
	}
	
	public void update(EmployeeEntity employee) {
		String sql = "UPDATE EMPLOYEE SET  EMPLOYEE_NAME = ?, EMPLOYEE_BIRTHDAY=? , GOVERNMENT_ID=?, EMPLOYEE_PHONE=?, EMPLOYEE_EMAIL=?"
				+ "EMPLOYEE_ADDRESS=?,EMPLOYEE_IMAGE=?,EMPLOYEE_SALARY=? WHERE EMPLOYEE_ID = ? ";
		jdbcTemplate.update(sql,   employee.getName(),employee.getBirthday(),
				employee.getGovernmentid(),employee.getPhone(),employee.getEmail(),employee.getAddress(),employee.getImage(),employee.getSalary());
	}

	public EmployeeEntity findById(int id) {
		String sql = "SELECT * FROM EMPLOYEE WHERE EMPLOYEE_ID = ?";
		return jdbcTemplate.queryForObject(sql, new EmployeeMapper(), id);
	}

	public List<EmployeeEntity> findAll() {
		String sql = "SELECT * FROM EMPLOYEE";
		return jdbcTemplate.query(sql, new EmployeeMapper());
	}
	
	public List<EmployeeEntity>findEmployee(String name){
		String sql = "SELECT * FROM EMPLOYEE WHERE EMPLOYEE_NAME LIKE '%"+name+"%'";
		return jdbcTemplate.query(sql, new EmployeeMapper());
	}


}
