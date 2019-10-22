package com.had.hotelmanagement.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.Account;

@Repository
@Transactional
public class LoginDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public String xacnhan(Account ac) {
		try {
			String sql = "SELECT ro.rolename FROM account ac ,role ro where  ro.roleid = ac.roleid and ac.username = ? and ac.password = ?";

			String rolename = jdbcTemplate.queryForObject(sql, new Object[] { ac.getUsername(), ac.getPassword() },
					String.class);

			return rolename;
		} catch (Exception e) {
			return null;
		}

	}
	public String user(Account ac) {
		try {
			String sql = "SELECT ac.username FROM account ac ,role ro where  ro.roleid = ac.roleid and ac.username = ? and ac.password = ?";

			String name = jdbcTemplate.queryForObject(sql, new Object[] { ac.getUsername(), ac.getPassword() },
					String.class);

			return name;
		} catch (Exception e) {
			return null;
		}

	}
	public void ChangePassword(Account ac) {
		String sql = " update had_hotel.account set  password = ? where username = ?";
		jdbcTemplate.update(sql, ac.getPassword(), ac.getUsername());
	}

}
