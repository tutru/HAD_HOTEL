package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.PaymentTypeEntity;
import com.had.hotelmanagement.entity.PaymentTypeMapper;
import com.had.hotelmanagement.entity.ServiceEntity;
import com.had.hotelmanagement.entity.ServiceMapper;

@Repository
@Transactional
public class PaymentTypeDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public void save(PaymentTypeEntity payment) {
		String sql = "INSERT INTO paymenttype(paymenttypename,paymenttypedesc) VALUES (?,?)";
		jdbcTemplate.update(sql, payment.getPaymenttypename(),
				payment.getPaymenttypedesc());
	}

	public void delete(int paymenttypeid) {
		String sql = "DELETE FROM paymenttype WHERE paymenttypeid = " + paymenttypeid;
		jdbcTemplate.update(sql);
	}
	
	public void deletePayment(int paymenttypeid) {
		String sql = "DELETE FROM payment WHERE paymenttypeid = " + paymenttypeid;
		jdbcTemplate.update(sql);
	}
	
	public void update(PaymentTypeEntity paymentType) {
		String sql = "UPDATE paymenttype SET  paymenttypename = ?, paymenttypedesc=?  WHERE paymenttypeid = ? ";
		jdbcTemplate.update(sql,   paymentType.getPaymenttypename(),paymentType.getPaymenttypedesc(), paymentType.getPaymenttypeid());
	}

	public PaymentTypeEntity findById(int id) {
		String sql = "SELECT * FROM paymenttype WHERE paymenttypeid = ?";
		return jdbcTemplate.queryForObject(sql, new PaymentTypeMapper(), id);
	}

	public List<PaymentTypeEntity> findAll() {
		String sql = "SELECT * FROM paymenttype";
		return jdbcTemplate.query(sql, new PaymentTypeMapper());
	}
	
	public List<PaymentTypeEntity>findPaymentType(String name){
		String sql = "SELECT * FROM paymenttype WHERE paymenttypename LIKE '%"+name+"%'";
		return jdbcTemplate.query(sql, new PaymentTypeMapper());
	}

}
