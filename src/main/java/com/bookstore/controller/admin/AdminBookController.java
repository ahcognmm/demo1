package com.bookstore.controller.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.PublisherDAO;
import com.bookstore.model.Book;
import com.bookstore.model.Category;
import com.bookstore.model.Publisher;
@Controller
@RequestMapping("/admin/book-manage")
public class AdminBookController {
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private PublisherDAO publisherDAO;
	
	@RequestMapping(value="") 
	public String showBookManage(Model model) {
		List<Book> books = bookDAO.findAll();
		model.addAttribute("books", books);
		model.addAttribute("totalBook", books.size());
		return "admin/book-manage";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String getAddBookForm(Model model) {
		List<Category> categories = categoryDAO.findAll();
		List<Publisher> publishers = publisherDAO.findAll();
		Book theBook = new Book();
		model.addAttribute("book", theBook);
		model.addAttribute("mode", "add");
		model.addAttribute("categories", categories);
		model.addAttribute("publishers", publishers);
		return "admin/book-add";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String saveBook(@Valid @ModelAttribute("book") Book theBook,
							BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors() ) {
			model.addAttribute("bindingError", "Vui lòng không để trống mục nào");
			return getAddBookForm(model);
		}

		boolean result = bookDAO.saveBook(theBook);
		if (result == false) {
			model.addAttribute("bindingError", "Thêm sách lỗi");
			return getAddBookForm(model);
		}
		return "redirect:/admin/book-manage";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET) 
	public String getUpdateBookForm(@RequestParam("id") int bookID, Model model) {
		Book book = bookDAO.findBy(bookID);
		model.addAttribute("book", book);
		return "admin/book-update";
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateBook(@RequestParam("id") int id, @Valid @ModelAttribute("book") Book theBook,
							BindingResult bindingResult, Model model) {
		theBook.setId(id);
		if (bindingResult.hasErrors() ) {
			model.addAttribute("bindingError", "Vui lòng không để trống mục nào");
			System.out.println(theBook.getId());
			return getUpdateBookForm(theBook.getId(),model);
		}

		boolean result = bookDAO.updateBook(theBook);				// Thêm DAO update
		if (result == false) {
			model.addAttribute("bindingError", "Cập nhật sách lỗi");
			return getUpdateBookForm(theBook.getId(),model);
		}
		return "redirect:/admin/book-manage";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteBook(@RequestParam("id") int id) {
		boolean result = bookDAO.deleteBook(id);
		if (result == false) {
			System.out.println("Xóa lỗi");
		} 
		return "redirect:/admin/book-manage";
	}
}
