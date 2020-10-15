package com.dbal.app.problem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.problem.MemberVO;
import com.dbal.app.problem.mapper.MemberListMapper;
import com.dbal.app.problem.service.MemberListService;

@Service
public class MemberListServiceImpl implements MemberListService{
	
	@Autowired MemberListMapper memberDAO;

	@Override
	public List<MemberVO> getMemberList(MemberVO memberVO) {
		return memberDAO.getMemberList();
	}

}
