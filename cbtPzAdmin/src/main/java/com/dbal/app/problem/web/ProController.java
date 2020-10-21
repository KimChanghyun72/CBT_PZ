package com.dbal.app.problem.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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

	// 등록페이지
	@RequestMapping("insertProForm")
	public String insertProForm(ProblemVO vo, HashtagVO vo1, Model model, 
			@CookieValue(value="name", required=false) Cookie name,
			HttpServletRequest request) {
		model.addAttribute("proList", proservice.getProList(vo));
		request.getSession().setAttribute("name", name.getValue());
		return "problem/quizInsert";
	}

	// 등록처리
	@RequestMapping("insertPro")
	public String insertPro(ProblemVO vo, HashtagVO vo1) {
		proservice.insertPro(vo, vo1);
		return "redirect:insertProForm";
	}

	// 업데이트
	@RequestMapping("updatePro")
	public String updatePro(ProblemVO vo) {
		proservice.updatePro(vo);
		return "redirect:insertProForm";
	}

	// 삭제
	@RequestMapping("deletePro")
	public String deletePro(ProblemVO vo) {
		proservice.deletePro(vo);
		return "redirect:insertProForm";
	}

	// 조회페이지
	/*
	 * @RequestMapping("getProList") public String getPro(ProblemVO vo, Model model)
	 * { model.addAttribute("proList", proservice.getPro(vo)); return
	 * "problem/quizInsert"; }
	 */
}
