package com.zero.service;

import com.zero.domain.MemberVO;

public interface MemberService {
	MemberVO selectMemberById(String id);
	void insertMember(MemberVO vo);
}
