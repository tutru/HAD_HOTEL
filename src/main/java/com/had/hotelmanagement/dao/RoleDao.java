package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.Role;
import com.had.hotelmanagement.entity.RoleMapper;



@Repository
@Transactional
public class RoleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void save(Role role) {
		String sql = "INSERT INTO role (role_name,role_desc) VALUES (?,?)";
		jdbcTemplate.update(sql, role.getRole_name(), role.getRole_desc());

	}

	public void delete(int id) {
		String sql = "DELETE FROM role WHERE role_id = " + id;
		jdbcTemplate.update(sql);
	}

	public void update(Role role) {
		String sql = "UPDATE role SET role_name	 = ?, role_desc = ? WHERE  role_id = ? ";
		jdbcTemplate.update(sql,role.getRole_name(), role.getRole_desc(),role.getRole_id());
	}	
	
	public Role findById(int role_id) {
		String sql = "SELECT * FROM role WHERE role_id = ?";
		return jdbcTemplate.queryForObject(sql, new RoleMapper(), role_id);
	}

	public List<Role> findAll() {
		String sql = "SELECT * FROM role";
		return jdbcTemplate.query(sql, new RoleMapper());
	}

//	public List<Role>findnhanvienten(String tennv){
//		String sql = "SELECT * FROM role WHERE tennv LIKE '%"+tennv+"%'";
//		return jdbcTemplate.query(sql, new RoleMapper());
//	}
}
