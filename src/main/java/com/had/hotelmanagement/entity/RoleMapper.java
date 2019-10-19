package com.had.hotelmanagement.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RoleMapper implements RowMapper<Role> {

	@Override
	public Role mapRow(ResultSet rs, int rowNum) throws SQLException {
		Role role = new Role();
		role.setRoleid(rs.getInt("roleid"));
		role.setRolename(rs.getString("rolename"));
		role.setRoledesc(rs.getString("roledesc"));
		return role;
	}

	
}
