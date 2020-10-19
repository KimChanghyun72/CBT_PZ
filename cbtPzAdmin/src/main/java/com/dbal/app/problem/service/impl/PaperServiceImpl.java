package com.dbal.app.problem.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.problem.HashtagVO;
import com.dbal.app.problem.PaperheadVO;
import com.dbal.app.problem.ProblemVO;
import com.dbal.app.problem.mapper.HashMapper;
import com.dbal.app.problem.mapper.PaperHeadMapper;
import com.dbal.app.problem.mapper.ProblemMapper;
import com.dbal.app.problem.service.PaperService;

@Service
public class PaperServiceImpl implements PaperService{

	@Autowired PaperHeadMapper headDAO;
	@Autowired ProblemMapper proDAO;
	@Autowired HashMapper hashDAO;
	
	@Override
	public void insertPhead(PaperheadVO paperheadVo, ProblemVO problemVO, HashtagVO hashtagVO) {
		headDAO.insertPhead(paperheadVo);
		proDAO.insertPro(problemVO);	
		hashtagVO.setProblem_id(problemVO.getProblem_id());
		hashDAO.insertHash(hashtagVO);
	}
}
