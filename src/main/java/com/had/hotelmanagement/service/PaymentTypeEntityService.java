package com.had.hotelmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.dao.PaymentTypeDAO;
import com.had.hotelmanagement.dao.ServiceDAO;
import com.had.hotelmanagement.entity.PaymentTypeEntity;
import com.had.hotelmanagement.entity.ServiceEntity;

@Service
@Transactional
public class PaymentTypeEntityService {
	@Autowired
	private PaymentTypeDAO paymentTypeDAO;
	public List<PaymentTypeEntity> findAll() {
		return paymentTypeDAO.findAll();
	}
	public PaymentTypeEntity findByIdhd(int id) {
		return paymentTypeDAO.findById(id);
	}
	
	public void save(PaymentTypeEntity paymentType){
		// validate business
		paymentTypeDAO.save(paymentType);
	}

	public void update(PaymentTypeEntity paymentType){
		// validate business
		paymentTypeDAO.update(paymentType);
	}
	
	public void delete(int id){
		// validate business
		paymentTypeDAO.delete(id);
	}
	public List<PaymentTypeEntity> searchEmployee(String name) {
		return paymentTypeDAO.findPaymentType(name);
	}
}
