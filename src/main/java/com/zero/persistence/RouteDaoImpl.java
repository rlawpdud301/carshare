package com.zero.persistence;

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

}
