package com.dbal.app.problem.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.problem.MemberVO;
import com.dbal.app.problem.service.MemberListService;

@Controller
public class MemberListController {
	
	@Autowired
	MemberListService memberservice;
	
	@RequestMapping("memberList")
	public String getPro(MemberVO vo, Model model) {
		model.addAttribute("memberList", memberservice.getMemberList(vo));
		System.out.println("memlist"+memberservice.getMemberList(vo));
		return "member/memberList";
	} 
}
