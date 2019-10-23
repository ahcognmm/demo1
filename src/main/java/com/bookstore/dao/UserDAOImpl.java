package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstore.model.User;

@Repository
public class UserDAOImpl implements UserDAO{
	@Autowired
	private DataSource dataSource;
	
	private Connection conn = null;
	private PreparedStatement preStatament = null;
	private ResultSet result = null;
	
	// Demo
	public boolean isExistsUser(User user) {
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("SELECT * FROM user WHERE user.username = ? OR user.email = ?");
			preStatament.setString(1, user.getUserName());
			preStatament.setString(2,  user.getEmail());
			result = preStatament.executeQuery();
			// Nếu đã tồn tại user
			if (result.next() == true) {
				return true;
			} else {
				return false;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			return true;
		}
	}

	/**
	 * Lưu người dùnng mới
	 */
	@Override
	public boolean saveUser(User user) {
		try {
		conn = dataSource.getConnection();
		preStatament = conn.prepareStatement("INSERT INTO user(username, password, first_name, last_name, email, phone_number)"
				+ " VALUES (?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
		preStatament.setString(1, user.getUserName());
		preStatament.setString(2, user.getPassword());
		preStatament.setString(3, user.getFirstName());
		preStatament.setString(4, user.getLastName());
		preStatament.setString(5, user.getEmail());
		preStatament.setString(6, user.getPhoneNumber());
		
		// Xử lý và lấy id của user mới 
		int affected = preStatament.executeUpdate();
		// Nếu số dòng thêm vào là 1 ~ insert thành công
		if (affected == 1) {
			result = preStatament.getGeneratedKeys();
			result.next();
			// Get id của user vừa tạo
			int newID = result.getInt(1);
			System.out.println(newID);
			
			// Thêm role cho user nếu tạo user thành công
			preStatament = conn.prepareStatement("INSERT INTO user_role(user_id, role) VALUES(?, ?)");
			preStatament.setInt(1, newID);
			preStatament.setString(2, user.getRole());
			preStatament.executeUpdate();	
			return true;
	
		} else {
			return false;
		}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public User getUserById(int id) {
		User user = new User();
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("SELECT id,username, first_name, last_name, email, phone_number FROM user WHERE id = ?");
			preStatament.setInt(1, id);
			
			result = preStatament.executeQuery();
			
			if(result.next()) {
				user.setId(result.getInt(1));
				user.setUserName(result.getString(2));
				user.setFirstName(result.getString(3));
				user.setLastName(result.getString(4));
				user.setEmail(result.getString(5));
				user.setPhoneNumber(result.getString(6));
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return user;
	}

	@Override
	public int getIdByUserName(String username) {
		int userID = -1;
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("SELECT id FROM user WHERE username = ?");
			preStatament.setString(1, username);
			result = preStatament.executeQuery();
			
			if(result.next()) {
				userID = result.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return -1;
		}
		
		return userID;
	}

	@Override
	public void update(User user) {
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("UPDATE user SET first_name = ?, last_name = ?, phone_number = ?"
					+ " WHERE id=?");
			preStatament.setString(1, user.getFirstName());
			preStatament.setString(2, user.getLastName());
			preStatament.setString(3, user.getPhoneNumber());
			preStatament.setInt(4, user.getId());
			preStatament.executeUpdate();
		
		}catch(SQLException e ) {
			e.printStackTrace();
		}
	
	}

	@Override
	public String getPasswordByUserName(String name) {
		String password = null;
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("SELECT password FROM user WHERE username = ?");
			preStatament.setString(1, name);
			result = preStatament.executeQuery();
			
			if(result.next()) {
				password = result.getString(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return password;
	}

	@Override
	public void updatePassword(String password, String name) {
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("UPDATE user SET password = ? WHERE username = ?");
			preStatament.setString(1, password);
			preStatament.setString(2, name);
			preStatament.executeUpdate();
	
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
}
