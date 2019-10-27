package com.had.hotelmanagement.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="service")
public class PaymentTypeEntity {
	@Id
	@GeneratedValue
	private int paymenttypeid;
	private String paymenttypename;
	private String paymenttypedesc;
	public PaymentTypeEntity() {
		super();
	}
	public PaymentTypeEntity(int paymenttypeid, String paymenttypename, String paymenttypedesc) {
		super();
		this.paymenttypeid = paymenttypeid;
		this.paymenttypename = paymenttypename;
		this.paymenttypedesc = paymenttypedesc;
	}
	public int getPaymenttypeid() {
		return paymenttypeid;
	}
	public void setPaymenttypeid(int paymenttypeid) {
		this.paymenttypeid = paymenttypeid;
	}
	public String getPaymenttypename() {
		return paymenttypename;
	}
	public void setPaymenttypename(String paymenttypename) {
		this.paymenttypename = paymenttypename;
	}
	public String getPaymenttypedesc() {
		return paymenttypedesc;
	}
	public void setPaymenttypedesc(String paymenttypedesc) {
		this.paymenttypedesc = paymenttypedesc;
	}
	
}
