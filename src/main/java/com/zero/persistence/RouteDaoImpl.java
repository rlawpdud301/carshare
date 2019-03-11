package com.zero.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.domain.RouteVO;


@Repository
public class RouteDaoImpl implements RouteDAO {

	private static final String namespace = "com.zero.mapper.RouteMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertRoute(RouteVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertRoute",vo);
	}

	@Override
	public String selectLastNo() {
		// TODO Auto-generated method stub		
		return sqlSession.selectOne(namespace + ".selectLastNo");
	}

	@Override
	public RouteVO selectRoutByRouteNo(String RouteNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectRoutByRouteNo",RouteNo);
	}

	@Override
	public void deleteRoutByRouteNo(String memberNo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".deleteRoutByRouteNo",memberNo);
	}

	@Override
	public List<RouteVO> findMyAround(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".findMyAround",map);
	}

	@Override
	public void addOpponentNo(RouteVO routeVO) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".addOpponentNo",routeVO);
	}

	@Override
	public RouteVO findMyRouteuseOpponentNo(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".findMyRouteuseOpponentNo",memberNo);
	}

	@Override
	public List<RouteVO> selectFavorByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectFavorByMemberNo",memberNo);
	}

	@Override
	public String selectFavorLastNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectFavorLastNo");
	}

	@Override
	public List<RouteVO> selectFavorRoutByMap(Map<String, Object> conditionMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectFavorRoutByMap",conditionMap);
	}

	@Override
	public RouteVO selectRoutByRouteNoA(String routeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectRoutByRouteNoA",routeNo);
	}

	@Override
	public void deleteFavorRouteByRouteNo(String routeNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".deleteFavorRouteByRouteNo",routeNo);
	}

}
