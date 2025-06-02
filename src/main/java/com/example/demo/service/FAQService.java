package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.FAQRepository;
import com.example.demo.vo.FAQ;

@Service
public class FAQService {

	@Autowired
	private FAQRepository faqRepository;

	public FAQService(FAQRepository faqRepository) {
		this.faqRepository = faqRepository;
	}

	public List<FAQ> getPrintFAQ() {
		return faqRepository.getPrintFAQ();
	}

	public List<FAQ> getPrintFAQByKeyword(String searchKeyword) {

		return faqRepository.getPrintFAQByKeyword(searchKeyword);
	}

}
