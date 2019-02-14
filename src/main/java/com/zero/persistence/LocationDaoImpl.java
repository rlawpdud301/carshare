package com.zero.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.domain.LocationVO;

@Repository
public class LocationDaoImpl implements LocationDAO {
	
	private static final String namespace = "com.zero.mapper.LocationMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertLocation(LocationVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertLocation",vo);
	}

	@Override
	public LocationVO selectLocation(LocationVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectLocation",vo);
	}

}
