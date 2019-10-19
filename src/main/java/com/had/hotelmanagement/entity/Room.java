package com.had.hotelmanagement.entity;
///////
public class Room {
	private int roomid;
	private int roomtypeid;
	private int roomstatusid;
	private String roomimage;
	private String roomdesc;
	public Room() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Room [roomid=" + roomid + ", roomtypeid=" + roomtypeid + ", roomstatusid=" + roomstatusid
				+ ", roomimage=" + roomimage + ", roomdesc=" + roomdesc + "]";
	}
	public Room(int roomid, int roomtypeid, int roomstatusid, String roomimage, String roomdesc) {
		super();
		this.roomid = roomid;
		this.roomtypeid = roomtypeid;
		this.roomstatusid = roomstatusid;
		this.roomimage = roomimage;
		this.roomdesc = roomdesc;
	}
	public int getRoomid() {
		return roomid;
	}
	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}
	public int getRoomtypeid() {
		return roomtypeid;
	}
	public void setRoomtypeid(int roomtypeid) {
		this.roomtypeid = roomtypeid;
	}
	public int getRoomstatusid() {
		return roomstatusid;
	}
	public void setRoomstatusid(int roomstatusid) {
		this.roomstatusid = roomstatusid;
	}
	public String getRoomimage() {
		return roomimage;
	}
	public void setRoomimage(String roomimage) {
		this.roomimage = roomimage;
	}
	public String getRoomdesc() {
		return roomdesc;
	}
	public void setRoomdesc(String roomdesc) {
		this.roomdesc = roomdesc;
	}
	
       
}
