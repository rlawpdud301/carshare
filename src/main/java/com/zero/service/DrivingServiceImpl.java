package com.zero.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.domain.MemberVO;
import com.zero.domain.UseInfoVO;
import com.zero.persistence.UseInfoDAO;

@Service
public class DrivingServiceImpl implements DrivingService {

	@Autowired
	private UseInfoDAO useInfoDAO;


	@Override
	public UseInfoVO startDrive(UseInfoVO useInfoVO) {
		// TODO Auto-generated method stub
		useInfoVO = useInfoDAO.selectUseInfoByDriverNo(useInfoVO.getdMemberNo().getMemberNo());
		useInfoDAO.updateUseInfo(useInfoVO);
		return useInfoVO;
	}

}
