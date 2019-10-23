package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstore.model.Address;

@Repository
public class AddressDAOImpl implements AddressDAO{
	@Autowired
	private DataSource dataSource;
	private Connection conn = null;
	private PreparedStatement preStatement = null;
	private ResultSet result = null;
	
	@Override
	public List<Address> findAll(){
		List<Address> list = new ArrayList<Address>();
		String select = "SELECT * FROM address";
		
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(select);
			result = preStatement.executeQuery();
			while(result.next()) {
				Address address = new Address();
				address.setId(result.getInt(1));
				address.setUserId(result.getInt(2));
				address.setAddress(result.getString(3));
				list.add(address);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// OK
	@Override
	public int save(Address address) {
		int idNewAddress = -1;
		String insert = "INSERT INTO address(user_id,full_name,phone,detail) VALUES(?,?,?,?)";
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			preStatement.setInt(1, address.getUserId());
			preStatement.setString(2, address.getFullName());
			preStatement.setString(3, address.getPhone());
			preStatement.setString(4, address.getAddress());
			preStatement.executeUpdate();
			result = preStatement.getGeneratedKeys();
			if (result.next()) {
				idNewAddress = result.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		return idNewAddress;
	}

	@Override
	public Address findBy(int id) {
		Address address = new Address();
		String select = "SELECT id, full_name, phone, detail, is_default , user_id FROM address WHERE id = ?";
		
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(select);
			preStatement.setInt(1, id);
			result = preStatement.executeQuery();
			if(result.next()) {
				address.setId(result.getInt(1));
				address.setFullName(result.getString(2));
				address.setPhone(result.getString(3));
				address.setAddress(result.getString(4));
				address.setIsDefault(result.getInt(5));
				address.setUserId(result.getInt(6));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return address;
	}

	@Override
	public List<Address> findByUserId(int userId) {
		List<Address> list = new ArrayList<Address>();
		String select = "SELECT id, user_id, detail, full_name, phone,is_default FROM address WHERE user_id = ?";
		
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(select);
			preStatement.setInt(1, userId);
			result = preStatement.executeQuery();
			while(result.next()) {
				Address address = new Address();
				address.setId(result.getInt(1));
				address.setUserId(result.getInt(2));
				address.setAddress(result.getString(3));
				address.setFullName(result.getString(4));
				address.setPhone(result.getString(5));
				address.setIsDefault(result.getInt(6));
				list.add(address);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
}
