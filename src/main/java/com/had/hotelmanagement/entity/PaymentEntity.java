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
	private Double roomprice;
	private String roomnumber;
	private Double tienthua;
	public Double getTienthua() {
		return tienthua;
	}
	public void setTienthua(Double tienthua) {
		this.tienthua = tienthua;
	}
	public String getRoomnumber() {
		return roomnumber;
	}
	public void setRoomnumber(String roomnumber) {
		this.roomnumber = roomnumber;
	}
	public PaymentEntity() {
		
	}
	public Double getRoomprice() {
		return roomprice;
	}
	public void setRoomprice(Double roomprice) {
		this.roomprice = roomprice;
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
