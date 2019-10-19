package com.had.hotelmanagement.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;



public class EmployeeMapper implements RowMapper<EmployeeEntity> {

	public EmployeeEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		EmployeeEntity employee = new EmployeeEntity();
		employee.setName(rs.getString("id"));
		employee.setBirthday(rs.getDate("birthday"));
		employee.setGovernmentid(rs.getInt("governmentid"));
		employee.setPhone(rs.getString("phone"));
		employee.setEmail(rs.getString("email"));
		employee.setAddress(rs.getString("address"));
		employee.setImage(rs.getString("image"));
		employee.setSalary(rs.getDouble("salary"));
		return employee;
	}

}
