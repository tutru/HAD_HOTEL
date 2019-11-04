package com.had.hotelmanagement.entity;

///////
public class Room {
	private int roomid;
	private int roomtypeid;
	private int roomstatusid;
	private int roomnumber;
	private Double roomprice;
	private String roomimage;
	private String roomdesc;
	private String roomtypename;
	private String roomstatusname;
	public Room() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Room(int roomid, int roomtypeid, int roomstatusid, int roomnumber, Double roomprice, String roomimage,
			String roomdesc, String roomtypename, String roomstatusname) {
		super();
		this.roomid = roomid;
		this.roomtypeid = roomtypeid;
		this.roomstatusid = roomstatusid;
		this.roomnumber = roomnumber;
		this.roomprice = roomprice;
		this.roomimage = roomimage;
		this.roomdesc = roomdesc;
		this.roomtypename = roomtypename;
		this.roomstatusname = roomstatusname;
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



	public int getRoomnumber() {
		return roomnumber;
	}



	public void setRoomnumber(int roomnumber) {
		this.roomnumber = roomnumber;
	}



	public Double getRoomprice() {
		return roomprice;
	}



	public void setRoomprice(Double roomprice) {
		this.roomprice = roomprice;
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



	public String getRoomtypename() {
		return roomtypename;
	}



	public void setRoomtypename(String roomtypename) {
		this.roomtypename = roomtypename;
	}



	public String getRoomstatusname() {
		return roomstatusname;
	}



	public void setRoomstatusname(String roomstatusname) {
		this.roomstatusname = roomstatusname;
	}



	@Override
	public String toString() {
		return "Room [roomid=" + roomid + ", roomtypeid=" + roomtypeid + ", roomstatusid=" + roomstatusid
				+ ", roomnumber=" + roomnumber + ", roomprice=" + roomprice + ", roomimage=" + roomimage + ", roomdesc="
				+ roomdesc + ", roomtypename=" + roomtypename +", roomstatusname=" + roomstatusname +"]";
	}
	
}
