package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.Account;
import com.had.hotelmanagement.entity.AccountMapper;
import com.had.hotelmanagement.entity.Role;
import com.had.hotelmanagement.entity.RoleMapper;

@Repository
@Transactional
public class AccountDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void save(Account ac) {
		String sql = "INSERT INTO account (employeeid,roleid,username,password) VALUES (?,?,?,?)";
		jdbcTemplate.update(sql, ac.getEmployeeid(), ac.getRoleid(),ac.getUsername(),ac.getPassword());

	}

	public void delete(int id) {
		String sql = "DELETE FROM account WHERE accountid = " + id;
		jdbcTemplate.update(sql);
	}

	public void update(Account ac) {
		String sql = "UPDATE account SET employeeid = ?, roleid = ?, username = ?, password = ? WHERE  accountid = ? ";
		jdbcTemplate.update(sql,ac.getEmployeeid(), ac.getRoleid(),ac.getUsername(),ac.getPassword(),ac.getAccountid());
	}	
	
	public Account findById(int id) {
		String sql = "SELECT * FROM account WHERE accountid = ?";
		return jdbcTemplate.queryForObject(sql, new AccountMapper(), id);
	}

	public List<Account> findAll() {
		String sql = "SELECT * FROM account";
		return jdbcTemplate.query(sql, new AccountMapper());
	}

	public List<Account>findaccount(String nhanvien){
		String sql = "SELECT * FROM account WHERE username LIKE '%"+nhanvien+"%'";
		return jdbcTemplate.query(sql, new AccountMapper());
	}
	

}
