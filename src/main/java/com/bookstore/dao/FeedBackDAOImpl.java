package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.bookstore.model.FeedBack;

@Repository
public class FeedBackDAOImpl implements FeedBackDAO {
	@Autowired
	private DataSource dataSource;
	private Connection conn = null;
	private ResultSet result = null;
	private PreparedStatement preStatement = null;
	
	
	@Override
	public boolean saveFeedBack(FeedBack feedback) {
		String insert = "INSERT INTO feedback(name, email, subject,message) VALUES (?,?,?,?)";
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(insert);
			preStatement.setString(1, feedback.getName());
			preStatement.setString(2, feedback.getEmail());
			preStatement.setString(3, feedback.getSubject());
			preStatement.setString(4, feedback.getMessage());
			
			if(preStatement.executeUpdate() > 0)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public List<FeedBack> findAll(int page, int total){
		List<FeedBack> list = new ArrayList<FeedBack>();
		String select = "SELECT id, name, email, subject,message FROM feedback ORDER BY id DESC LIMIT " + total +" offset "+ total*(page-1);
		
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(select);
			result = preStatement.executeQuery();
			while(result.next()) {
				FeedBack feedback = new FeedBack();
				feedback.setId(result.getInt(1));
				feedback.setName(result.getString(2));
				feedback.setEmail(result.getString(3));
				feedback.setSubject(result.getString(4));
				feedback.setMessage(result.getString(5));
				list.add(feedback);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	

	
	@Override
	public boolean deleteFeedBack(int id) {
		String delete = "DELETE FROM feedback WHERE id = ?";
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(delete);
			preStatement.setInt(1, id);
			if(preStatement.executeUpdate() > 0)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public int getSize() {
		int size = -1;
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT count(*) from feedback ");
			result = preStatement.executeQuery();
			if (result.next()) {
				size = result.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return size;
	}
}
