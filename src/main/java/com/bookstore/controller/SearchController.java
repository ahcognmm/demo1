package com.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.PublisherDAO;
import com.bookstore.model.Book;
import com.bookstore.model.Category;
import com.bookstore.model.Publisher;

@Controller
@RequestMapping("/shopping/search")
public class SearchController {
	@Autowired 
	private BookDAO bookDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private PublisherDAO publisherDAO;
	
	private final int NUMBER_ODER_ONE_PAGE = 8;

	@RequestMapping("withName")
	public String searchBooks(@RequestParam("query") String search,@RequestParam("page") int page, Model model, HttpServletRequest request ) {
		List<Book> books = bookDAO.searchByName(search);
		List<Category> categories = categoryDAO.findAll();
		if (categories.size() > 5) {
			categories = categories.subList(0, 5);
		}
		List<Publisher> publishers = publisherDAO.findAll();
		if (publishers.size() > 5) {
			publishers.subList(0, 5);
		}
		request.getSession().setAttribute("categories", categories);
		request.getSession().setAttribute("publishers", publishers);
		
		// Display books by page
				if(books.size() > page * NUMBER_ODER_ONE_PAGE) {
					books = books.subList((page-1)*NUMBER_ODER_ONE_PAGE, page*NUMBER_ODER_ONE_PAGE);
				} else if (books.size() > (page-1)*NUMBER_ODER_ONE_PAGE){
					books = books.subList((page-1)*NUMBER_ODER_ONE_PAGE, books.size());
				}
		int totalPage = (int)(Math.ceil((double)books.size()/NUMBER_ODER_ONE_PAGE));
		model.addAttribute("books", books);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("type", "book");
		model.addAttribute("query", search);
		return "search-result";
	}
	@RequestMapping("/withCategory")
	public String searchBooksWithCategory(@RequestParam("id") int categoryId,@RequestParam("page") int page, Model model) {
		List<Book> books = bookDAO.findByCategory(categoryId);
		// Display books by page
				if(books.size() > page * NUMBER_ODER_ONE_PAGE) {
					books = books.subList((page-1)*NUMBER_ODER_ONE_PAGE, page*NUMBER_ODER_ONE_PAGE);
				} else if (books.size() > (page-1)*NUMBER_ODER_ONE_PAGE){
					books = books.subList((page-1)*NUMBER_ODER_ONE_PAGE, books.size());
				}

		int totalPage = (int)(Math.ceil((double)books.size()/NUMBER_ODER_ONE_PAGE));
		model.addAttribute("books", books);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("type", "category");
		model.addAttribute("categoryId", categoryId);

		return "search-result";
	}
	@RequestMapping("/withPublisher")
	public String searchBooksWithPublisher(@RequestParam("id") int publisherId,@RequestParam("page") int page, Model model) {
		List<Book> books = bookDAO.findByPublisher(publisherId);
		
		// Display books by page
		if(books.size() > page * NUMBER_ODER_ONE_PAGE) {
			books = books.subList((page-1)*NUMBER_ODER_ONE_PAGE, page*NUMBER_ODER_ONE_PAGE);
		} else if (books.size() > (page-1)*NUMBER_ODER_ONE_PAGE){
			books = books.subList((page-1)*NUMBER_ODER_ONE_PAGE, books.size());
		}
		int totalPage = (int)(Math.ceil((double)books.size()/NUMBER_ODER_ONE_PAGE));
		model.addAttribute("books", books);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("type", "publisher");
		model.addAttribute("publisherId", publisherId);

		return "search-result";
	}
	
}
