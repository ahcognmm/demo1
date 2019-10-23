package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;
import java.util.*;
import com.bookstore.model.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	@Autowired
	private DataSource dataSource;
	private Connection conn = null;
	private PreparedStatement preStatement = null;
	private ResultSet result = null;
	
	@Override
	public List<Review> findByBookId(int bookId){
		List<Review> list = new ArrayList<Review>();
		
		String select = "SELECT user_id, content, created_at, rating FROM review WHERE book_id = ? ORDER BY created_at DESC";
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(select);
			preStatement.setInt(1,bookId);
			result = preStatement.executeQuery();
			while(result.next()) {
				Review review = new Review();
				
				review.setUserId(result.getInt(1));
				
				review.setContent(result.getString(2));
				review.setCreated_at(result.getString(3));
				review.setBookId(bookId);
				review.setRating(result.getInt(4));
				list.add(review);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	@Override
	public boolean saveReview(Review review) {
		String insert = "INSERT INTO review(user_id,book_id,content, rating) VALUES(?,?,?,?)";
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(insert);
			preStatement.setInt(1, review.getUserId());
			preStatement.setInt(2, review.getBookId());
			preStatement.setString(3, review.getContent());
			preStatement.setInt(4, review.getRating());
			if(preStatement.executeUpdate() > 0)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	@Override
	public boolean deleteReview(int id) {
		String delete  = "DELETE FROM review WHERE id = ?";
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
	public boolean updateReview(Review review) {
		String update = "UPDATE review SET content = ? WHERE id = ?";
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(update);
			preStatement.setString(1, review.getContent());
			preStatement.setInt(2, review.getId());
			if(preStatement.executeUpdate() > 0)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}
}
