package com.dbal.app.problem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.problem.HashtagVO;
import com.dbal.app.problem.ProblemVO;
import com.dbal.app.problem.mapper.HashMapper;
import com.dbal.app.problem.mapper.ProblemMapper;
import com.dbal.app.problem.service.ProService;

@Service
public class ProServiceImpl implements ProService {
	
	@Autowired ProblemMapper proDAO;
	@Autowired HashMapper hashDAO;


	@Override
	public void insertPro(ProblemVO problemVO, HashtagVO vo1) {
		proDAO.insertPro(problemVO);	
		vo1.setProblem_id(problemVO.getProblem_id());
		hashDAO.insertHash(vo1);
	}

	@Override
	public ProblemVO getPro(ProblemVO problemVO) {
		return proDAO.getPro(problemVO);
	}
}
