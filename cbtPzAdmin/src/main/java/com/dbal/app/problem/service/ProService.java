package com.dbal.app.problem.service;


import com.dbal.app.problem.HashtagVO;
import com.dbal.app.problem.ProblemVO;

public interface ProService {
	public void insertPro(ProblemVO problemVO, HashtagVO vo1);
	public ProblemVO getPro(ProblemVO problemVO);
}





