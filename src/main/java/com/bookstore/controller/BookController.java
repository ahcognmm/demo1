package com.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CartDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.dao.UserDAO;
import com.bookstore.model.Book;
import com.bookstore.model.Cart;
import com.bookstore.model.Category;
import com.bookstore.model.Review;

/*
 * Lớp xử lý request với sách 
 */
@Controller

public class BookController {
	
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	
	
	@GetMapping("/shopping/book-detail")
	public String getBookDetail(@RequestParam("id") int bookID, Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (! (auth instanceof AnonymousAuthenticationToken) ) {
			Cart cart = cartDAO.findByCartId(Integer.parseInt(request.getSession().getAttribute("cartId").toString()));
			request.getSession().setAttribute("cart", cart);
			request.getSession().setAttribute("bookMap", cart.getBookMap());
		}
		
		Book theBook = bookDAO.findBy(bookID);
		List<Review> reviews = reviewDAO.findByBookId(bookID);
		
		// Sách liên quan
		Category category =categoryDAO.findBy(theBook.getCategory());
		List<Book> relationalBook = bookDAO.findByCategory(category.getId(), 3);
		
		for (Review review : reviews) {
			review.setUserName(userDAO.getUserById(review.getUserId()).getUserName());
		}
		
		
		if (theBook != null ) {
			model.addAttribute("theBookID", bookID);
			model.addAttribute("theBook", theBook);
			model.addAttribute("reviews", reviews);
			model.addAttribute("review", new Review());
			model.addAttribute("relationalBook", relationalBook);
		
		}
		return "book-detail";

	}

	@PostMapping("/shopping/submit-review") 
	public String submitReview(@RequestParam("hdrating") int rating,@Valid @ModelAttribute(name="review") Review review
								, BindingResult bindingResult
								,HttpServletRequest request) {
		if(bindingResult.hasErrors()) {
			System.out.println("Invalid form");
			return "redirect:/shopping/book-detail?id=" + review.getBookId() + "#Reviews";
		}
		
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		
		review.setUserId(userId);
		review.setRating(rating);

		// Save review
		boolean res = reviewDAO.saveReview(review);
		if (res == true) {
			System.out.println("Lưu thành công");
		} else {
			System.out.println("Review không thành công");
		}
		
		return "redirect:/shopping/book-detail?id=" + review.getBookId()+"#Reviews";
	}
}
