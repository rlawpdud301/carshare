package com.zero.persistence;

import com.zero.domain.MemberVO;

public interface MemberDAO {
	MemberVO selectMemberById(String id);
	void insertMember(MemberVO vo);
}
