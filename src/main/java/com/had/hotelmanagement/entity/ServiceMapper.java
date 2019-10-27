package com.had.hotelmanagement.entity;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
public class ServiceMapper implements RowMapper<ServiceEntity> {
	public ServiceEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		ServiceEntity service = new ServiceEntity();
		service.setServiceid(rs.getInt("serviceid"));
		service.setServicename(rs.getString("servicename"));
		service.setServicedesc(rs.getString("servicedesc"));
		return service;
	}	

}
