package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.Reservation;
import com.had.hotelmanagement.entity.ReservationMapper;


@Repository
@Transactional
public class ReservationDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void save(Reservation reservation) {
		String sql = "INSERT INTO reservation (customerid, roomtypeid, expectedcheckdate, expectedroom, isdeposit, reservationstatus) VALUES (?,?,?,?,?,?)";
		jdbcTemplate.update(sql, reservation.getCustomerid(), reservation.getRoomtypeid(),reservation.getExpectedcheckdate(),
				reservation.getExpectedroom(),reservation.getIsdeposit(),reservation.getReservationstatus());
	}

	public void delete(int reservationid) {
		String sql = "DELETE FROM reservation WHERE reservationid = " + reservationid;
		jdbcTemplate.update(sql);
	}
	
	public void update(Reservation reservation) {
		String sql = "UPDATE reservation SET customerid = ? , roomtypeid = ? , expectedcheckdate = ? , expectedroom = ? , isdeposit = ? , reservationstatus = ? WHERE reservationid = ? ";
		jdbcTemplate.update(sql, reservation.getCustomerid(), reservation.getRoomtypeid(),reservation.getExpectedcheckdate(),
				reservation.getExpectedroom(),reservation.getIsdeposit(),reservation.getReservationstatus(),reservation.getReservationid());
	}

	public Reservation findById(int reservationid) {
		String sql = "SELECT * FROM reservation WHERE reservationid = ?";
		return jdbcTemplate.queryForObject(sql, new ReservationMapper(), reservationid);
	}

	public List<Reservation> findAll() {
		String sql = "SELECT RSV.reservationid, RSV.customerid, RSV.roomtypeid, RSV.expectedcheckdate, RSV.expectedroom, RSV.isdeposit,\r\n" + 
				"RSV.reservationstatus, CTM.name, RT.roomtypename\r\n" + 
				"FROM reservation AS RSV\r\n" + 
				"INNER JOIN customer AS CTM ON RSV.customerid = CTM.customerid\r\n" + 
				"INNER JOIN roomtype AS RT ON RSV.roomtypeid = RT.roomtypeid";
		return jdbcTemplate.query(sql, new ReservationMapper());
	}
}
