package com.had.hotelmanagement.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RoleMapper implements RowMapper<Role> {

	@Override
	public Role mapRow(ResultSet rs, int rowNum) throws SQLException {
		Role role = new Role();
		role.setRole_id(rs.getInt("role_id"));
		role.setRole_name(rs.getString("role_name"));
		role.setRole_desc(rs.getString("role_desc"));
		return role;
	}

	
}
