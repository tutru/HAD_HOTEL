package com.had.hotelmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.Customer;
import com.had.hotelmanagement.entity.CustomerMapper;


@Repository
@Transactional
public class CustomerDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	

	public void save(Customer customer) {
		String sql = "INSERT INTO customer (name, governmentid, address, phone, email, image, ccnumber) VALUES (?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, customer.getName(), customer.getGovernmentid(),customer.getAddress(),
				customer.getPhone(),customer.getEmail(),customer.getImage(),customer.getCcnumber());
	}

	public void delete(int customerid) {
		String sql = "DELETE FROM customer WHERE customerid = " + customerid;
		jdbcTemplate.update(sql);
	}
	
	public void update(Customer customer) {
		String sql = "UPDATE customer SET name = ? , governmentid = ? , address = ? , phone = ? , email = ? , image = ? , ccnumber = ? WHERE customerid = ? ";
		jdbcTemplate.update(sql, customer.getName(), customer.getGovernmentid(), customer.getAddress(),
				customer.getPhone(),customer.getEmail(),customer.getImage(), customer.getCcnumber(), customer.getCustomerid());
	}

	public Customer findById(int customerid) {
		String sql = "SELECT * FROM customer WHERE customerid = ?";
		return jdbcTemplate.queryForObject(sql, new CustomerMapper(), customerid);
	}

	public List<Customer> findAll() {
		String sql = "SELECT * FROM customer";
		return jdbcTemplate.query(sql, new CustomerMapper());
	}
	
//	public List<KhachHang> listKhachHang() {
//		String sql = "SELECT ten FROM khachhang";
//		return jdbcTemplate.query(sql, new KhachHangMapper());
//	}
	
//	public List<KhachHang> findHoaDon(String tenkh) {
//		String sql = SQL_FIND_HOA_DON;
//		return jdbcTemplate.query(sql, new KhachHangMapper(), tenkh);
//	}

}
