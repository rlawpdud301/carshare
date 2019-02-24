package com.zero.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.domain.MemberVO;
import com.zero.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Override
	public MemberVO selectMemberById(Map<String, String> id) {
		// TODO Auto-generated method stub
		return dao.selectMemberById(id);
	}

	@Override
	public int insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.insertMember(vo);
		Map<String, String> id = new HashMap<>();
		id.put("kakaoId", vo.getKakaoId());
		id.put("naverId", vo.getNaverId());
		return dao.selectMemberById(id).getMemberNo();
	}

}
