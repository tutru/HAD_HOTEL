package com.had.hotelmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.dao.PaymentDAO;
import com.had.hotelmanagement.dao.ServiceDAO;
import com.had.hotelmanagement.entity.PaymentEntity;
import com.had.hotelmanagement.entity.ServiceEntity;

@Service
@Transactional
public class PaymentService {
	@Autowired
	private PaymentDAO paymentDAO;
	public List<PaymentEntity> findAll() {
		return paymentDAO.findAll();
	}

	public PaymentEntity findByIdhd(int id) {
		return paymentDAO.findById(id);
	}
	
	public void save(PaymentEntity payment){
		// validate business
		paymentDAO.save(payment);
	}

	public void update(PaymentEntity payment){
		// validate business
		paymentDAO.update(payment);
	}
	
	public void delete(int id){
		// validate business
		paymentDAO.delete(id);
	}
	
}
