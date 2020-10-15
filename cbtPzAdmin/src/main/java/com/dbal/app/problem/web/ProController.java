package com.dbal.app.problem.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.problem.HashtagVO;
import com.dbal.app.problem.ProblemVO;
import com.dbal.app.problem.service.HashService;
import com.dbal.app.problem.service.ProService;

@Controller
public class ProController {
	
	@Autowired
	ProService proservice;
	@Autowired
	HashService hashservice; 
	
	//등록페이지
	@RequestMapping("insertProForm")
	public String insertProForm(ProblemVO vo, HashtagVO vo1) {
		return "problem/quizInsert";
	}
	
	//등록처리
	@RequestMapping("insertPro")
	public String insertPro(ProblemVO vo, HashtagVO vo1) {
		proservice.insertPro(vo, vo1);
		return "redirect:insertProForm";
	}
	
	//조회페이지
	@RequestMapping("getPro")
	public String getPro(ProblemVO vo, Model model) {
		model.addAttribute("list", proservice.getPro(vo));
		return "insertPro";
	}
}
