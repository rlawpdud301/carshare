package com.zero.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.domain.MemberVO;
import com.zero.domain.RouteVO;
import com.zero.domain.UseInfoVO;
import com.zero.persistence.MemberDAO;
import com.zero.persistence.RouteDAO;
import com.zero.persistence.UseInfoDAO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private UseInfoDAO useInfoDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private RouteDAO routeDAO;

	@Override
	public Map<String, Object> findHistory(int memberNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("uMmemberNo", memberNo);
		List<UseInfoVO> useInfoVOUser = useInfoDAO.selectDoneUseInfoByMap(conditionMap);
		map.put("userList", useInfoVOUser);
		
		conditionMap.remove("uMmemberNo");
		conditionMap.put("dMmemberNo", memberNo);
		
		List<UseInfoVO> useInfoVODriver = useInfoDAO.selectDoneUseInfoByMap(conditionMap);
		map.put("driverList", useInfoVODriver);
		return map;
	}

	@Override
	public MemberVO selectMemberByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberByMemberNo(memberNo);
	}

	@Override
	public Map<String, Object> findMyfavorRout(int memberNo) {
		// TODO Auto-generated method stub
				Map<String, Object> map = new HashMap<>();
				
				Map<String, Object> conditionMap = new HashMap<>();
				conditionMap.put("uMmemberNo", memberNo);
				List<RouteVO> RoutVoUser = routeDAO.selectFavorRoutByMap(conditionMap);
				map.put("userList", RoutVoUser);
				
				conditionMap.remove("uMmemberNo");
				conditionMap.put("dMmemberNo", memberNo);
				
				List<RouteVO> RoutVoDriver = routeDAO.selectFavorRoutByMap(conditionMap);
				map.put("driverList", RoutVoDriver);
				return map;
	}

	@Override
	public RouteVO selectRouteByRoutNo(String routeNo) {
		// TODO Auto-generated method stub
		return routeDAO.selectRoutByRouteNoA(routeNo);
	}

	@Override
	public void removeFavorRouteByRouteNo(String routeNo) {
		// TODO Auto-generated method stub
		routeDAO.deleteFavorRouteByRouteNo(routeNo);
	}
	
	

}
