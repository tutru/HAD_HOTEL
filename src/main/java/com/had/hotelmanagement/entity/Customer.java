package com.had.hotelmanagement.entity;


public class Customer {
	
    private int customerid;
    private String customername;
    private int governmentid;
    private String customeraddress;
    private String customerphone;
    private String customeremail;
    private String customerimage;
    private int ccnumber;
    
	public Customer() {
	}

	public Customer(int customerid, String customername, int governmentid, String customeraddress, String customerphone,
			String customeremail, String customerimage, int ccnumber) {
		super();
		this.customerid = customerid;
		this.customername = customername;
		this.governmentid = governmentid;
		this.customeraddress = customeraddress;
		this.customerphone = customerphone;
		this.customeremail = customeremail;
		this.customerimage = customerimage;
		this.ccnumber = ccnumber;
	}

	@Override
	public String toString() {
		return "Customer [customerid=" + customerid + ", customername=" + customername + ", governmentid="
				+ governmentid + ", customeraddress=" + customeraddress + ", customerphone=" + customerphone
				+ ", customeremail=" + customeremail + ", customerimage=" + customerimage + ", ccnumber=" + ccnumber
				+ "]";
	}

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public int getGovernmentid() {
		return governmentid;
	}

	public void setGovernmentid(int governmentid) {
		this.governmentid = governmentid;
	}

	public String getCustomeraddress() {
		return customeraddress;
	}

	public void setCustomeraddress(String customeraddress) {
		this.customeraddress = customeraddress;
	}

	public String getCustomerphone() {
		return customerphone;
	}

	public void setCustomerphone(String customerphone) {
		this.customerphone = customerphone;
	}

	public String getCustomeremail() {
		return customeremail;
	}

	public void setCustomeremail(String customeremail) {
		this.customeremail = customeremail;
	}

	public String getCustomerimage() {
		return customerimage;
	}

	public void setCustomerimage(String customerimage) {
		this.customerimage = customerimage;
	}

	public int getCcnumber() {
		return ccnumber;
	}

	public void setCcnumber(int ccnumber) {
		this.ccnumber = ccnumber;
	}
    
    
}
