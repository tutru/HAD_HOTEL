package com.had.hotelmanagement.entity;

public class Customer {

    private int customerid;
    private String name;
    private String governmentid;
    private String address;
    private String phone;
    private String email;
    private String ccnumber;
    private String image;
	public Customer() {
		super();
	}
	public Customer(int customerid, String name, String governmentid, String address, String phone, String email,
			String ccnumber, String image) {
		super();
		this.customerid = customerid;
		this.name = name;
		this.governmentid = governmentid;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.ccnumber = ccnumber;
		this.image = image;
	}
	@Override
	public String toString() {
		return "Customer [customerid=" + customerid + ", name=" + name + ", governmentid=" + governmentid + ", address="
				+ address + ", phone=" + phone + ", email=" + email + ", ccnumber=" + ccnumber + ", image=" + image
				+ "]";
	}
	public int getCustomerid() {
		return customerid;
	}
	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGovernmentid() {
		return governmentid;
	}
	public void setGovernmentid(String governmentid) {
		this.governmentid = governmentid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCcnumber() {
		return ccnumber;
	}
	public void setCcnumber(String ccnumber) {
		this.ccnumber = ccnumber;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
    
	
}
