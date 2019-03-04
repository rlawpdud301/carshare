package com.zero.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.domain.MemberVO;
import com.zero.domain.RouteVO;
import com.zero.persistence.DriverApplyDAO;
import com.zero.persistence.MemberDAO;
import com.zero.persistence.RouteDAO;

@Service
public class DriverServiceImpl implements DriverService {

	@Autowired
	private RouteDAO routeDAO;
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List<RouteVO> findMyAround(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return routeDAO.findMyAround(map);
	}

	@Override
	public MemberVO selectMemberByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberByMemberNo(memberNo);
	}
	
	@Override
	public void waitingApproval(RouteVO routeVO) {
		// TODO Auto-generated method stub
		routeDAO.addOpponentNo(routeVO);
		
	}

	@Override
	public void setDriverWhere(MemberVO memberVO) {
		// TODO Auto-generated method stub
		memberDAO.setDriverWhere(memberVO);
	}
	
}
