package com.dbal.app.problem.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.problem.HashtagVO;
import com.dbal.app.problem.service.HashService;

@Controller
public class HashController {
	@Autowired 
	HashService hashService;
	
		//등록페이지
		@RequestMapping("inserHashtagtForm")
		public String insertHashForm(HashtagVO vo) {
			return "problem/quizInsert";
		}
		
		//등록처리
		@RequestMapping("insertHash")
		public String insertHash(HashtagVO vo) {
			hashService.insertHash(vo);
			return "redirect:insertProForm";
		}
}
