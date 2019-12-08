package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.Account;
import com.had.hotelmanagement.entity.AccountMapper;


@Repository
@Transactional
public class AccountDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void save(Account ac) {
		String sql = "INSERT INTO account (employeeid,roleid,username,password) VALUES (?,?,?,?)";
		jdbcTemplate.update(sql, ac.getEmployeeid(), ac.getRoleid(), ac.getUsername(), ac.getPassword());

	}

	public void delete(int id) {
		String sql = "DELETE FROM account WHERE accountid = " + id;
		jdbcTemplate.update(sql);
	}
	
	public void deleteEmployee(int employeeid) {
		String sql = "DELETE FROM account WHERE employeeid = " + employeeid;
		jdbcTemplate.update(sql);
	}

	public void update(Account ac) {
		String sql = "UPDATE account SET employeeid = ?, roleid = ?, username = ?, password = ? WHERE  accountid = ? ";
		jdbcTemplate.update(sql, ac.getEmployeeid(), ac.getRoleid(), ac.getUsername(), ac.getPassword(),
				ac.getAccountid());
	}

	public Account findById(int id) {
		String sql = "SELECT * FROM account WHERE accountid = ?";
		//return jdbcTemplate.queryForObject(sql, new AccountMapper(), id);
		return (Account) jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper(Account.class));

	}

	public List<Account> findAll() {
		String sql = "select accountid ,ac.employeeid ,ac.roleid , name , rolename , username , password "
				+ "from employee em join account ac on em.employeeid = ac.employeeid join role ro on ro.roleid = ac.roleid"; 			
		//String sql = "SELECT * FROM account";
		return jdbcTemplate.query(sql, new AccountMapper());
		
	}

	/*
	 * public List<Account> findaccount(String nhanvien) { String sql =
	 * "SELECT * FROM account WHERE username LIKE '%" + nhanvien + "%'"; return
	 * jdbcTemplate.query(sql, new AccountMapper()); }
	 */
	public String ckeck(Account ac) {
		try {
			String sql = "select  count(*) FROM had_hotel.account ac where ac.username  = ?";
			String name = jdbcTemplate.queryForObject(sql, new Object[] { ac.getUsername() }, String.class);

			return name;
		} catch (Exception e) {
			return null;
		}

	}

}
