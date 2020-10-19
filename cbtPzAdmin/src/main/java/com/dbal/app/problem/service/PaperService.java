package com.dbal.app.problem.service;

import com.dbal.app.problem.HashtagVO;
import com.dbal.app.problem.PaperheadVO;
import com.dbal.app.problem.ProblemVO;

public interface PaperService {
	public void insertPhead(PaperheadVO paperheadVo, ProblemVO problemVO, HashtagVO hashtagVO);
}
