package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.FAQService;
import com.example.demo.vo.FAQ;

@Controller
public class FAQController {

	@Autowired
	private FAQService faqService;

	@RequestMapping("/usr/FAQ/list")
	public String list(Model model, @RequestParam(defaultValue = "") String searchKeyword) {
		List<FAQ> FAQ = null;
		if (searchKeyword.isEmpty()) {
			FAQ = faqService.getPrintFAQ();
		} else {
			FAQ = faqService.getPrintFAQByKeyword(searchKeyword);
		}

		model.addAttribute("FAQ", FAQ);

		return "/usr/FAQ/list";
	}

}
