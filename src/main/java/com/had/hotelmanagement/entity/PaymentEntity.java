package com.had.hotelmanagement.entity;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


public class PaymentEntity {
	
	private int paymentid;
	private int paymenttypeid;
	private int receptionid;
	private Double paymentamount;
	private Date paymentdate;
	public PaymentEntity() {
		
	}
	public int getPaymentid() {
		return paymentid;
	}
	public void setPaymentid(int paymentid) {
		this.paymentid = paymentid;
	}
	public int getPaymenttypeid() {
		return paymenttypeid;
	}
	public void setPaymenttypeid(int paymenttypeid) {
		this.paymenttypeid = paymenttypeid;
	}
	public int getReceptionid() {
		return receptionid;
	}
	public void setReceptionid(int receptionid) {
		this.receptionid = receptionid;
	}
	public Double getPaymentamount() {
		return paymentamount;
	}
	public void setPaymentamount(Double paymentamount) {
		this.paymentamount = paymentamount;
	}
	public Date getPaymentdate() {
		return paymentdate;
	}
	public void setPaymentdate(Date paymentdate) {
		this.paymentdate = paymentdate;
	}

	
}
