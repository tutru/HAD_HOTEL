package com.had.hotelmanagement.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;



public class CustomerMapper implements RowMapper<Customer>{
	public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
		Customer customer = new Customer();
		customer.setCustomerid(rs.getInt("CUSTOMER_ID "));
		customer.setCustomername(rs.getString("CUSTOMER_NAME "));
		customer.setGovernmentid(rs.getInt("GOVERNMENT_ID "));
		customer.setCustomeraddress(rs.getString("CUSTOMER_ADDRESS "));
		customer.setCustomerphone(rs.getString("CUSTOMER_PHONE "));
		customer.setCustomeremail(rs.getString("CUSTOMER_EMAIL "));
		customer.setCustomeremail(rs.getString("CUSTOMER_IMAGE "));
		customer.setCcnumber(rs.getInt("CC_NUMBER"));
		return customer;
	}
}
