package com.zero.service;

import java.util.Map;

import com.zero.domain.LoginDTO;
import com.zero.domain.MemberVO;
import com.zero.domain.RouteVO;

public interface NowuseService {

	void insertRoute(RouteVO vo);
	
	RouteVO selectRoutByRouteNo(String RouteNo);

	void deleteRoutByRouteNo(String trim);

	LoginDTO findOpponentNo(int memberNo);

	Map<String, Object> finduseInfoanddriverinfo(int memberNo);

	MemberVO selectMemberByMemberNo(int memberNo);
}
