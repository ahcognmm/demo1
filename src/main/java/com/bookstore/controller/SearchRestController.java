package com.bookstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bookstore.dao.BookDAO;

import com.bookstore.model.Book;

@RestController
public class SearchRestController{

	
	@Autowired 
	private BookDAO bookDAO;
	
	@GetMapping("/shopping/search")
	public List<Book> searchBook(@RequestParam("query") String input) {
		List<Book>  books = bookDAO.searchByName(input);
		// Chỉ lấy 8 kết quả
		if (books.size() > 8) {
			books = books.subList(0, 8);
		}
		
		return books;	
	}

}
