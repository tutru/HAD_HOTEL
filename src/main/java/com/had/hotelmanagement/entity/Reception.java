package com.had.hotelmanagement.entity;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Reception {
	
	@Id
    @GeneratedValue
	private int receptionid;
	private int customerid;
	private int reservationid;
	private int roomid;
	private Date checkindate;
	private Date expectedcheckindate;
	private Date checkoutdate;
	private int serviceid;
	private String receptionstatus;
	
	private String customername;
	private int roomnumber;
	private String servicename;
	
	public Reception() {

	}

	public Reception(int receptionid, int customerid, int reservationid, int roomid, Date checkindate,
			Date expectedcheckindate, Date checkoutdate, int serviceid, String receptionstatus, String customername,
			int roomnumber, String servicename) {
		super();
		this.receptionid = receptionid;
		this.customerid = customerid;
		this.reservationid = reservationid;
		this.roomid = roomid;
		this.checkindate = checkindate;
		this.expectedcheckindate = expectedcheckindate;
		this.checkoutdate = checkoutdate;
		this.serviceid = serviceid;
		this.receptionstatus = receptionstatus;
		this.customername = customername;
		this.roomnumber = roomnumber;
		this.servicename = servicename;
	}

	@Override
	public String toString() {
		return "Reception [receptionid=" + receptionid + ", customerid=" + customerid + ", reservationid="
				+ reservationid + ", roomid=" + roomid + ", checkindate=" + checkindate + ", expectedcheckindate="
				+ expectedcheckindate + ", checkoutdate=" + checkoutdate + ", serviceid=" + serviceid
				+ ", receptionstatus=" + receptionstatus + ", customername=" + customername + ", roomnumber="
				+ roomnumber + ", servicename=" + servicename + "]";
	}

	public int getReceptionid() {
		return receptionid;
	}

	public void setReceptionid(int receptionid) {
		this.receptionid = receptionid;
	}

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	public int getReservationid() {
		return reservationid;
	}

	public void setReservationid(int reservationid) {
		this.reservationid = reservationid;
	}

	public int getRoomid() {
		return roomid;
	}

	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}

	public Date getCheckindate() {
		return checkindate;
	}

	public void setCheckindate(Date checkindate) {
		this.checkindate = checkindate;
	}

	public Date getExpectedcheckindate() {
		return expectedcheckindate;
	}

	public void setExpectedcheckindate(Date expectedcheckindate) {
		this.expectedcheckindate = expectedcheckindate;
	}

	public Date getCheckoutdate() {
		return checkoutdate;
	}

	public void setCheckoutdate(Date checkoutdate) {
		this.checkoutdate = checkoutdate;
	}

	public int getServiceid() {
		return serviceid;
	}

	public void setServiceid(int serviceid) {
		this.serviceid = serviceid;
	}

	public String getReceptionstatus() {
		return receptionstatus;
	}

	public void setReceptionstatus(String receptionstatus) {
		this.receptionstatus = receptionstatus;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public int getRoomnumber() {
		return roomnumber;
	}

	public void setRoomnumber(int roomnumber) {
		this.roomnumber = roomnumber;
	}

	public String getServicename() {
		return servicename;
	}

	public void setServicename(String servicename) {
		this.servicename = servicename;
	}
	
	
}
