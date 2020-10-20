package com.dbal.app.problem.service;


import java.util.List;

import com.dbal.app.problem.HashtagVO;
import com.dbal.app.problem.ProblemVO;

public interface ProService {
	public void insertPro(ProblemVO problemVO, HashtagVO vo1);
	public ProblemVO getPro(ProblemVO problemVO);
	public List<ProblemVO> getProList(ProblemVO problemVO);
	public void updatePro(ProblemVO problemVO);
	public void deletePro(ProblemVO problemVO);
}





