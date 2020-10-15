package com.dbal.app.problem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.problem.HashtagVO;
import com.dbal.app.problem.mapper.HashMapper;
import com.dbal.app.problem.service.HashService;

@Service
public class HashServiceImpl implements HashService{
	
	@Autowired HashMapper hashDAO;
	
	@Override
	public void insertHash(HashtagVO hashtagVO) {
		hashDAO.insertHash(hashtagVO);
	}

}
