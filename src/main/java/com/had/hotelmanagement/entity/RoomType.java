package com.had.hotelmanagement.entity;

public class RoomType {
	private int roomtypeid;
	private String roomtypename;
	private String roomtypedesc;
	private Double roomprice;
	public RoomType() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "RoomType [roomtypeid=" + roomtypeid + ", roomtypename=" + roomtypename + ", roomtypedesc="
				+ roomtypedesc + ", roomprice=" + roomprice + "]";
	}
	public RoomType(int roomtypeid, String roomtypename, String roomtypedesc, Double roomprice) {
		super();
		this.roomtypeid = roomtypeid;
		this.roomtypename = roomtypename;
		this.roomtypedesc = roomtypedesc;
		this.roomprice = roomprice;
	}
	public int getRoomtypeid() {
		return roomtypeid;
	}
	public void setRoomtypeid(int roomtypeid) {
		this.roomtypeid = roomtypeid;
	}
	public String getRoomtypename() {
		return roomtypename;
	}
	public void setRoomtypename(String roomtypename) {
		this.roomtypename = roomtypename;
	}
	public String getRoomtypedesc() {
		return roomtypedesc;
	}
	public void setRoomtypedesc(String roomtypedesc) {
		this.roomtypedesc = roomtypedesc;
	}
	public Double getRoomprice() {
		return roomprice;
	}
	public void setRoomprice(Double roomprice) {
		this.roomprice = roomprice;
	}
	
	

}
