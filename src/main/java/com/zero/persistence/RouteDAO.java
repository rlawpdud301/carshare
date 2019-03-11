package com.zero.persistence;

import java.util.List;
import java.util.Map;

import com.zero.domain.RouteVO;

public interface RouteDAO {
	
	void insertRoute(RouteVO vo);

	String selectLastNo();
	
	RouteVO selectRoutByRouteNo(String RouteNo);

	void deleteRoutByRouteNo(String memberNo);

	List<RouteVO> findMyAround(Map<String, Object> map);

	void addOpponentNo(RouteVO routeVO);

	RouteVO findMyRouteuseOpponentNo(int memberNo);

	List<RouteVO> selectFavorByMemberNo(int memberNo);

	String selectFavorLastNo();

	List<RouteVO> selectFavorRoutByMap(Map<String, Object> conditionMap);

	RouteVO selectRoutByRouteNoA(String routeNo);

	void deleteFavorRouteByRouteNo(String routeNo);
}
