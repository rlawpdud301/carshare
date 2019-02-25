package com.zero.service;

import java.util.Map;

import com.zero.domain.CarInfoVO;
import com.zero.domain.LicenseInfoVO;
import com.zero.domain.MemberVO;

public interface MemberService {
	MemberVO selectMemberById(Map<String, String> id);
	int insertMember(MemberVO vo);
	void addDriverUser(CarInfoVO carInfoVO, LicenseInfoVO licenseInfoVO);
	MemberVO selectMemberByMemberNo(int memberNo);
}
