package com.dbal.app.problem.mapper;

import java.util.List;

import com.dbal.app.problem.ProblemVO;

public interface ProblemMapper {
	public ProblemVO getPro(ProblemVO problemVO);
	public List<ProblemVO> getProList();
	public void insertPro(ProblemVO problemVO);
	public void updatePro(ProblemVO problemVO);
	public void deletePro(ProblemVO problemVO);
}
