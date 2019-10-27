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
	public ServiceEntity() {
		super();
	}
	public ServiceEntity(int serviceid, String servicename, String servicedesc) {
		super();
		this.serviceid = serviceid;
		this.servicename = servicename;
		this.servicedesc = servicedesc;
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
	
	
}
