package com.zero.service;

import java.util.Map;

import com.zero.domain.MemberVO;

public interface MemberService {
	MemberVO selectMemberById(Map<String, String> id);
	int insertMember(MemberVO vo);
}
