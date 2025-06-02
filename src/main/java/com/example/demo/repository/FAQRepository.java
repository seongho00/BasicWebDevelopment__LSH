package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.FAQ;

@Mapper
public interface FAQRepository {

	public List<FAQ> getPrintFAQ();

	public List<FAQ> getPrintFAQByKeyword(String searchKeyword);



}
