package com.bookstore.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.model.Category;

@Controller
@RequestMapping("/admin/category-manage")
public class AdminCategoryController {
	@Autowired
	private CategoryDAO categoryDAO;
	
	@GetMapping("")
	public String getCategoryManage(Model model) {
		List<Category> categoryList = categoryDAO.findAll();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("total", categoryList.size());
		return "admin/category-manage";
	}

}
