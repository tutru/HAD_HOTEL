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
	
//	final String SQL_FIND_CUSTOMER = "SELECT CM.CUSTOMER_ID, CM.CUSTOMER_NAME, CM.GOVERNMENT_ID, CM.CUSTOMER_ADDRESS, CM.CUSTOMER_PHONE, CM.CUSTOMER_EMAIL, CM.CUSTOMER_IMAGE, CM.CC_NUMBER   \r\n" + 
//			"FROM CUSTOMER AS CM \r\n" + 
//			"RIGHT JOIN sanpham AS SP ON HD.idsp = SP.idsp\r\n" + 
//			"RIGHT JOIN nhanvien AS NV ON HD.idnv = NV.idnv\r\n" + 
//			"RIGHT JOIN khachhang AS KH ON HD.idkh = KH.idkh\r\n" + 
//			"WHERE SP.tensp LIKE \"%?%\"\r\n" + 
//			"OR NV.tennv LIKE \"%?%\"\r\n" + 
//			"OR KH.ten LIKE \"%?%\"";

	public void save(Customer customer) {
		String sql = "INSERT INTO CUSTOMER (CUSTOMER_NAME, GOVERNMENT_ID, CUSTOMER_ADDRESS, CUSTOMER_PHONE, CUSTOMER_EMAIL, CUSTOMER_IMAGE, CC_NUMBER) VALUES (?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, customer.getCustomername(), customer.getGovernmentid(),customer.getCustomeraddress(),
				customer.getCustomerphone(),customer.getCustomeremail(),customer.getCustomerimage(),customer.getCcnumber());
	}

	public void delete(int customerid) {
		String sql = "DELETE FROM CUSTOMER WHERE CUSTOMER_ID = " + customerid;
		jdbcTemplate.update(sql);
	}
	
//	public void update(Customer customer) {
//		String sql = "UPDATE HoaDon SET idsp = ? , soluong = ? , ngaynhap = ? , idnv = ? , idkh = ? , ghichu = ? WHERE idhd = ? ";
//		jdbcTemplate.update(sql, hoadon.getIdsp(), hoadon.getSoluong(), hoadon.getNgaynhap(),
//				hoadon.getIdnv(),hoadon.getIdkh(),hoadon.getGhichu(), hoadon.getIdhd());
//	}
//
//	public HoaDon findById(int idhd) {
//		String sql = "SELECT * FROM HoaDon WHERE idhd = ?";
//		return jdbcTemplate.queryForObject(sql, new HoaDonMapper(), idhd);
//	}

	public List<Customer> findAll() {
		String sql = "SELECT * FROM CUSTOMER";
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
