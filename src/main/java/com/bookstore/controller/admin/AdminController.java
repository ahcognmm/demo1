package com.bookstore.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.dao.FeedBackDAO;
import com.bookstore.model.FeedBack;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private final int NUM_FEEDBACK_IN_PAGE = 5;
	@Autowired
	private FeedBackDAO feedbackDAO;
	
	@RequestMapping("/dashboard")
	public String showDashBoard() {
		
		return "admin/dashboard";
	}
	@RequestMapping("/feedback-manage")
	public String getFeedbacks(Model model,  @RequestParam("page") int page) {
		
		
		List<FeedBack> feedbacks = feedbackDAO.findAll(page, NUM_FEEDBACK_IN_PAGE);
		int totalFeedBack = feedbackDAO.getSize();
		int totalPage = (int)(Math.ceil((double)totalFeedBack/NUM_FEEDBACK_IN_PAGE));
		
		model.addAttribute("feedbacks", feedbacks);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		return "admin/feedback-manage";
	}
	
	
}
