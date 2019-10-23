package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.Review;

public interface ReviewDAO {
	List<Review> findByBookId(int bookId);
	boolean saveReview(Review review);
	boolean deleteReview(int id);
	boolean updateReview(Review review);
	
}
