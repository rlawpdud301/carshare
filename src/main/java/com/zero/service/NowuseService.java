package com.zero.service;

import com.zero.domain.RouteVO;

public interface NowuseService {

	void insertRoute(RouteVO vo);
	
	RouteVO selectRoutByRouteNo(String RouteNo);

	void deleteRoutByRouteNo(String trim);
}
