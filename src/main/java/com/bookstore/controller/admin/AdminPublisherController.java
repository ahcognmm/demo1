package com.bookstore.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.dao.PublisherDAO;
import com.bookstore.model.Publisher;

@Controller 
@RequestMapping("/admin/publisher-manage")
public class AdminPublisherController {
	
	@Autowired
	PublisherDAO publisherDAO;
	
	@RequestMapping("") 
	public String showAllPublisher(Model model) {
		List<Publisher> publishers = publisherDAO.findAll();
		model.addAttribute("publishers", publishers);
		
		return "admin/publisher-manage";
	}
	
	@RequestMapping("/delete")
	public String deletePublisher(@RequestParam("id") int id) {
		 publisherDAO.delete(id);
		
		return "redirect:/admin/publisher-manage";
	}
}
