package com.dbal.app.problem.service.impl;

import java.util.List;

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

	@Override
	public void updatePro(ProblemVO problemVO) {
		proDAO.updatePro(problemVO);
	}

	@Override
	public void deletePro(ProblemVO problemVO) {
		proDAO.deletePro(problemVO);
	}

	@Override
	public List<ProblemVO> getProList(ProblemVO problemVO) {
		return proDAO.getProList();
	}
}
