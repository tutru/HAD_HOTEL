package com.had.hotelmanagement.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.had.hotelmanagement.service.PaymentTypeEntityService;

public class PaymentTypeMapper implements RowMapper<PaymentTypeEntity> {
	public PaymentTypeEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		PaymentTypeEntity paymentType = new PaymentTypeEntity();
		paymentType.setPaymenttypeid(rs.getInt("paymenttypeid"));
		paymentType.setPaymenttypename(rs.getString("paymenttypename"));
		paymentType.setPaymenttypedesc(rs.getString("paymenttypedesc"));
		return paymentType;
	}	
}
