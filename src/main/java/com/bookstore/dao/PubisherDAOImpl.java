package com.bookstore.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstore.model.Publisher;


@Repository
public class PubisherDAOImpl implements PublisherDAO {
	@Autowired 				//nhúng bean DriverManagerDataSource đã khởi tạo vào dataSource
	private DataSource dataSource;
	
	private Connection conn = null;

	private ResultSet result = null;
	private PreparedStatement preStatement = null;
	
	@Override
	public List<Publisher> findAll() {
		List<Publisher> publishers = new ArrayList<>();
		try {
			conn = dataSource.getConnection();
			result = conn.createStatement().executeQuery("SELECT * FROM publisher");
			while(result.next()) {
				Publisher publisher = new Publisher();
				publisher.setId(result.getInt(1));
				publisher.setName(result.getString(2));
				publisher.setAddress(result.getString(4));
				publisher.setPhone(result.getString(3));
				
				publishers.add(publisher);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
		return publishers;
		
	}

	@Override
	public int add(Publisher publisher) {
		int newId = -1;
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("INSERT INTO publisher(name,phone,address) VALUES(?,?,?)", Statement.RETURN_GENERATED_KEYS);
			preStatement.setString(1, publisher.getName());
			preStatement.setString(2, publisher.getPhone());
			preStatement.setString(3, publisher.getAddress());
			int affected = preStatement.executeUpdate();
			if (affected == 0) {
				System.out.println("Creating user failed, no rows affected.");
				return -1;
			} else {
				result = preStatement.getGeneratedKeys();
				if (result.next()) {
					newId = result.getInt(1);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return newId;
	}

	@Override
	public boolean delete(int id) {
		String delete = "DELETE FROM publisher where id = ?";
		
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(delete);
			preStatement.setInt(1, id);
			if(preStatement.executeUpdate() > 0) 
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	// Tìm kiếm theo tên, nếu chưa có thì thêm vào 
	public Publisher findBy(String publisherName) {
		Publisher publisher = new Publisher();
		publisher.setName(publisherName);
		try {
			// Lấy id category
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT id, phone, address FROM publisher WHERE name = ?");
			preStatement.setString(1, publisherName);
			result = preStatement.executeQuery();
			if (result.next()) {
				publisher.setId(result.getInt(1));
				publisher.setPhone(result.getString(2));
				publisher.setAddress(result.getString(3));
			} 
			// Nếu chưa tồn tại thì thêm vào
			else {
				// thêm vào 
				int newId = add(publisher);
				if (newId != -1) {
					publisher.setId(newId);
				} else {
					System.out.println("Thêm publisher lỗi");
					return null;
				}
				
			}
		} catch(SQLException e ) {
			e.printStackTrace();
			return null;
		}
		return publisher;
		

	}

}
