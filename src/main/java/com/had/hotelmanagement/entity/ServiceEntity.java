package com.had.hotelmanagement.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="service")
public class ServiceEntity {
	@Id
	@GeneratedValue
	private int serviceid;
	private String servicename;
	private String servicedesc;
	private double serviceprice;
	public ServiceEntity() {
		super();
	}
	public ServiceEntity(int serviceid, String servicename, String servicedesc, double serviceprice ) {
		super();
		this.serviceid = serviceid;
		this.servicename = servicename;
		this.servicedesc = servicedesc;
		this.serviceprice = serviceprice;
	}
	public int getServiceid() {
		return serviceid;
	}
	public void setServiceid(int serviceid) {
		this.serviceid = serviceid;
	}
	public String getServicename() {
		return servicename;
	}
	public void setServicename(String servicename) {
		this.servicename = servicename;
	}
	public String getServicedesc() {
		return servicedesc;
	}
	public void setServicedesc(String servicedesc) {
		this.servicedesc = servicedesc;
	}
	public double getServiceprice() {
		return serviceprice;
	}
	public void setServiceprice(double serviceprice) {
		this.serviceprice = serviceprice;
	}

	
}
