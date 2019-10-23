package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.Category;

public interface CategoryDAO {
	List<Category> findAll();
	Category findBy(int categoryId);
	Category findBy(String categoryName);
	int add(Category category);
	boolean deleteCategory(int categoryId);
	boolean updateCategory(Category category);
	
}
