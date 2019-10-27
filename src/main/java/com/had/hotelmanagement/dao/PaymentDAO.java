package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.PaymentEntity;
import com.had.hotelmanagement.entity.ServiceEntity;
import com.had.hotelmanagement.entity.PaymentMapper;

@Repository
@Transactional
public class PaymentDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public void save(PaymentEntity payment) {
		String sql = "INSERT INTO payment (paymenttypeid, receptionid, paymentamount, paymentdate) VALUES (?,?,?,?)";
		jdbcTemplate.update(sql, payment.getPaymenttypeid(),payment.getReceptionid(),payment.getPaymentamount(),payment.getPaymentdate());
				
	}

	public void delete(int paymentid) {
		String sql = "DELETE FROM payment WHERE paymentid = " + paymentid;
		jdbcTemplate.update(sql);
	}
	
	public void update(PaymentEntity payment) {
		String sql = "UPDATE payment SET  paymenttypeid = ?, receptionid=?,paymentamount=?,paymentdate=?  WHERE paymentid = ? ";
		jdbcTemplate.update(sql,   payment.getPaymenttypeid(),payment.getReceptionid(), payment.getPaymentamount(),payment.getPaymentdate(),payment.getPaymentid());
	}

	public PaymentEntity findById(int paymentid) {
		String sql = "SELECT * FROM payment WHERE paymentid = ?";
		return jdbcTemplate.queryForObject(sql, new PaymentMapper(), paymentid);
	}

	public List<PaymentEntity> findAll() {
		String sql = "SELECT * FROM payment";
		return jdbcTemplate.query(sql, new PaymentMapper());
	}
	


}
