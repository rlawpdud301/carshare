package com.zero.persistence;

import java.util.Map;

import com.zero.domain.MemberVO;

public interface MemberDAO {
	MemberVO selectMemberById(Map<String, String> id);
	void insertMember(MemberVO vo);
	void updateDirverApply(MemberVO memberNo);
	MemberVO selectMemberByMemberNo(int memberNo);
	void setDriverWhere(MemberVO memberVO);
}
