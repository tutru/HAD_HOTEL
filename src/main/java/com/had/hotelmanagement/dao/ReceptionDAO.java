package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.Reception;
import com.had.hotelmanagement.entity.ReceptionMapper;
import com.had.hotelmanagement.entity.Reservation;

@Repository
@Transactional
public class ReceptionDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void save(Reception reception) {
		String sql = "INSERT INTO reception (customerid, reservationid, roomid, checkindate, expectedcheckindate, checkoutdate, serviceid, receptionstatus) VALUES (?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, reception.getCustomerid(), reception.getReservationid(),reception.getRoomid(),
				reception.getCheckindate(),reception.getExpectedcheckindate(),reception.getCheckoutdate(),reception.getServiceid(),reception.getReceptionstatus());
	}

	public void delete(int receptionid) {
		String sql = "DELETE FROM reception WHERE receptionid = " + receptionid;
		jdbcTemplate.update(sql);
	}
	
	public void deleteRctByRstId(int reservationid) {
		String sql = "DELETE FROM reception WHERE reservationid = " + reservationid;
		jdbcTemplate.update(sql);
	}
	
	public void deleteRctByCtmId(int customerid) {
		String sql = "DELETE FROM reception WHERE customerid = " + customerid;
		jdbcTemplate.update(sql);
	}
	
	public void update(Reception reception) {
		String sql = "UPDATE reception SET customerid = ? , reservationid = ? , roomid = ? , checkindate = ? , expectedcheckindate = ? , checkoutdate = ? , serviceid = ? , receptionstatus = ? WHERE receptionid = ? ";
		jdbcTemplate.update(sql, reception.getCustomerid(), reception.getReservationid(), reception.getRoomid(),
				reception.getCheckindate(),reception.getExpectedcheckindate(),reception.getCheckoutdate(), reception.getReservationid(), reception.getReceptionstatus(), reception.getReceptionid());
	}

	public Reception findById(int receptionid) {
		String sql = "SELECT * FROM reception WHERE receptionid = ?";
//		return jdbcTemplate.queryForObject(sql, new ReceptionMapper(), receptionid);
		return (Reception) jdbcTemplate.queryForObject(sql, new Object[] { receptionid }, new BeanPropertyRowMapper(Reception.class));
	}

	public List<Reception> findAll() {
		String sql = "SELECT RCT.receptionid, RCT.customerid, RCT.reservationid, RCT.roomid, RCT.checkindate,\r\n" + 
				"RCT.expectedcheckindate, RCT.checkoutdate, RCT.serviceid, RCT.receptionstatus,\r\n" + 
				"CTM.name, R.roomnumber, SV.servicename\r\n" + 
				"FROM reception AS RCT\r\n" + 
				"INNER JOIN customer AS CTM ON RCT.customerid = CTM.customerid\r\n" + 
				"INNER JOIN room AS R ON RCT.roomid = R.roomid\r\n" + 
				"INNER JOIN service AS SV ON RCT.serviceid = SV.serviceid";
		return jdbcTemplate.query(sql, new ReceptionMapper());
	}
}
