package com.had.hotelmanagement.entity;

public class RoomStatus {
	private int roomstatusid;
	private String roomstatusname;
	private String roomstatusdesc;
	public RoomStatus() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "RoomStatus [roomstatusid=" + roomstatusid + ", roomstatusname=" + roomstatusname + ", roomstatusdesc="
				+ roomstatusdesc + "]";
	}
	public RoomStatus(int roomstatusid, String roomstatusname, String roomstatusdesc) {
		super();
		this.roomstatusid = roomstatusid;
		this.roomstatusname = roomstatusname;
		this.roomstatusdesc = roomstatusdesc;
	}
	public int getRoomstatusid() {
		return roomstatusid;
	}
	public void setRoomstatusid(int roomstatusid) {
		this.roomstatusid = roomstatusid;
	}
	public String getRoomstatusname() {
		return roomstatusname;
	}
	public void setRoomstatusname(String roomstatusname) {
		this.roomstatusname = roomstatusname;
	}
	public String getRoomstatusdesc() {
		return roomstatusdesc;
	}
	public void setRoomstatusdesc(String roomstatusdesc) {
		this.roomstatusdesc = roomstatusdesc;
	}
	

}
