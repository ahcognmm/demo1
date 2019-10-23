package com.bookstore.dao;
import java.util.List;
import com.bookstore.model.FeedBack;
public interface FeedBackDAO {
	boolean saveFeedBack(FeedBack feedback);
	boolean deleteFeedBack(int id);
	List<FeedBack> findAll(int page, int total);
	int getSize();
}
