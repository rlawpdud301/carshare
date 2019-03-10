package com.zero.service;

import java.util.Map;

import com.zero.domain.MemberVO;
import com.zero.domain.RouteVO;

public interface HomeService {

	Map<String, Object> findHistory(int memberNo);

	MemberVO selectMemberByMemberNo(int memberNo);

	Map<String, Object> findMyfavorRout(int memberNo);

	RouteVO selectRouteByRoutNo(String routeNo);

}
 