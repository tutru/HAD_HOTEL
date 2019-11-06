package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.Reception;
import com.had.hotelmanagement.entity.ReceptionMapper;

@Repository
@Transactional
public class ReceptionDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	

	public void save(Reception reception) {
		String sql = "INSERT INTO reception (customerid, reservationid, roomid, checkindate, expectedcheckindate, checkoutdate, serviceid, reservationstatus) VALUES (?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, reception.getCustomerid(), reception.getReservationid(),reception.getRoomid(),
				reception.getCheckindate(),reception.getExpectedcheckindate(),reception.getCheckoutdate(),reception.getServiceid(),reception.getReservationstatus());
	}

	public void delete(int receptionid) {
		String sql = "DELETE FROM reception WHERE receptionid = " + receptionid;
		jdbcTemplate.update(sql);
	}
	
	public void update(Reception reception) {
		String sql = "UPDATE reception SET customerid = ? , reservationid = ? , roomid = ? , checkindate = ? , expectedcheckindate = ? , checkoutdate = ? , serviceid = ? , reservationstatus = ? WHERE receptionid = ? ";
		jdbcTemplate.update(sql, reception.getCustomerid(), reception.getReservationid(), reception.getRoomid(),
				reception.getCheckindate(),reception.getExpectedcheckindate(),reception.getCheckoutdate(), reception.getReservationid(), reception.getReservationstatus(), reception.getReceptionid());
	}

	public Reception findById(int receptionid) {
		String sql = "SELECT * FROM reception WHERE receptionid = ?";
		return jdbcTemplate.queryForObject(sql, new ReceptionMapper(), receptionid);
	}

	public List<Reception> findAll() {
		String sql = "SELECT * FROM reception";
		return jdbcTemplate.query(sql, new ReceptionMapper());
	}
}
