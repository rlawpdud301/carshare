package com.zero.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zero.domain.CarInfoVO;
import com.zero.domain.LicenseInfoVO;
import com.zero.domain.MemberVO;
import com.zero.persistence.CarInfoDAO;
import com.zero.persistence.LicenseInfoDAO;
import com.zero.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private CarInfoDAO carInfoDAO;
	@Autowired
	private LicenseInfoDAO licenseInfoDAO;
	
	@Override
	public MemberVO selectMemberById(Map<String, String> id) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberById(id);
	}

	@Override
	public int insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		memberDAO.insertMember(vo);
		Map<String, String> id = new HashMap<>();
		id.put("kakaoId", vo.getKakaoId());
		id.put("naverId", vo.getNaverId());
		return memberDAO.selectMemberById(id).getMemberNo();
	}

	@Override
	@Transactional
	public void addDriverUser(CarInfoVO carInfoVO, LicenseInfoVO licenseInfoVO) {
		// TODO Auto-generated method stub
		carInfoDAO.insertCarInfo(carInfoVO);
		licenseInfoDAO.insertLicenseInfo(licenseInfoVO);
		memberDAO.updateDirverApply(carInfoVO.getMemberNo());
	}

	@Override
	public MemberVO selectMemberByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberByMemberNo(memberNo);
	}

	

}
