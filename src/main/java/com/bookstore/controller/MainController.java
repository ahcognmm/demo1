package com.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CartDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.FeedBackDAO;
import com.bookstore.dao.PublisherDAO;
import com.bookstore.dao.UserDAO;
import com.bookstore.model.Book;
import com.bookstore.model.Cart;
import com.bookstore.model.Category;
import com.bookstore.model.FeedBack;
import com.bookstore.model.Publisher;

@Controller

public class MainController implements ErrorController{

	@Autowired
	private CartDAO cartDAO;	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired 
	private BookDAO bookDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private PublisherDAO publisherDAO;
	
	@Autowired
	private FeedBackDAO feedbackDAO;
	
	
	@RequestMapping(value= {"", "/"})
	public String home(HttpSession session, Model model) {
		// Get 6 sách mới nhât 
		List<Book> newBook = bookDAO.topNewBook(6);
		
		// Get 6 sách mua nhiều nhất
		List<Book> purchaseBook = bookDAO.topPurchaseBook(6);
		List<Book> interestingBook = bookDAO.topInterestingBook(8);
		List<Book> selfhelpBook = bookDAO.findByCategory(1, 3);
		
		List<Book> literaryBook = bookDAO.findByCategory(2,3);
		List<Book> economicBook = bookDAO.findByCategory(3,3);
		
		model.addAttribute("newBook", newBook);
		model.addAttribute("purchaseBook", purchaseBook);
		model.addAttribute("interestingBook", interestingBook);
		model.addAttribute("selfhelpBook", selfhelpBook);
		model.addAttribute("literaryBook", literaryBook);
		model.addAttribute("economicBook", economicBook);
		
		List<Category> categories = categoryDAO.findAll();
		List<Publisher> publishers = publisherDAO.findAll();
		
		session.setAttribute("categories", categories);
		session.setAttribute("publishers", publishers);

		
		// Nếu đã đăng nhập thì hiển thị giỏ hàng 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (! (auth instanceof AnonymousAuthenticationToken) ) {		// ~ !auth.getName().equals("anonymousUser")
			String username = auth.getName();
			System.out.println("Login : " + username);
			int userID = userDAO.getIdByUserName(username);
			// Get cart by id user
			Cart cart = cartDAO.findByUserId(userID);
				
			session.setAttribute("cart", cart);
			session.setAttribute("bookMap", cart.getBookMap());
			session.setAttribute("userId", userID);
			session.setAttribute("cartId", cart.getCartId());				
		}

		return "home";
	}
	
	// Xử lý lỗi url
	private static final String PATH = "/error";
	@RequestMapping(value=PATH)
	public String error404() {
		return "404";
	}
	@Override
	public String getErrorPath() {
		// TODO Auto-generated method stub
		return PATH;
	}
	
	@GetMapping("/shopping/contact") 
	public String getContactForm(Model model) {
		FeedBack feedback = new FeedBack();
		model.addAttribute("feedback", feedback);
		
		return "contact";
	}
	@PostMapping("/shopping/contact") 
	public String processContactForm(@Valid @ModelAttribute("feedback") FeedBack feedback,
									BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "contact";
		}
		
		System.out.println(feedback.getEmail());
		feedbackDAO.saveFeedBack(feedback);
		
		model.addAttribute("customerName", feedback.getName());
		return "contactSuccessful";
	}
	

	
	
	
}
