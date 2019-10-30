package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.Account;
import com.had.hotelmanagement.entity.Role;
import com.had.hotelmanagement.entity.RoleMapper;

@Repository
@Transactional
public class RoleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void save(Role role) {
		String sql = "INSERT INTO role (rolename,roledesc) VALUES (?,?)";
		jdbcTemplate.update(sql, role.getRolename(), role.getRoledesc());
////
	}

	public void delete(int id) {
		String sql = "DELETE FROM role WHERE roleid = " + id;
		jdbcTemplate.update(sql);
	}

	public void update(Role role) {
		String sql = "UPDATE role SET rolename	 = ?, roledesc = ? WHERE  roleid = ? ";
		jdbcTemplate.update(sql, role.getRolename(), role.getRoledesc(), role.getRoleid());
	}

	public Role findById(int roleid) {
		String sql = "SELECT * FROM role WHERE roleid = ?";
		return jdbcTemplate.queryForObject(sql, new RoleMapper(), roleid);
	}

	public List<Role> findAll() {
		String sql = "SELECT * FROM role";
		return jdbcTemplate.query(sql, new RoleMapper());
	}
	public String ckeck(Role role) {
		try {
			String sql = "select count(*) from role where rolename = ?";
			String name = jdbcTemplate.queryForObject(sql, new Object[] { role.getRolename() }, String.class);

			return name;
		} catch (Exception e) {
			return null;
		}
	
	}

}
