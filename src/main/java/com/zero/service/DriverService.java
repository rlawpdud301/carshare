package com.zero.service;

import java.util.List;
import java.util.Map;

import com.zero.domain.MemberVO;
import com.zero.domain.RouteVO;
import com.zero.domain.UseInfoVO;

public interface DriverService {

	List<RouteVO> findMyAround(Map<String, Object> map);

	MemberVO selectMemberByMemberNo(int memberNo);

	void waitingApproval(RouteVO routeVO);

	void setDriverWhere(MemberVO memberVO);
	
	UseInfoVO selectUseInfoByDriverNo(int driverNo);

}
