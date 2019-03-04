package com.zero.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.domain.CarInfoVO;

@Repository
public class CarInfoDaoImpl implements CarInfoDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.zero.mapper.CarInfoMapper";

	@Override
	public void insertCarInfo(CarInfoVO carInfoVO) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertCarInfo",carInfoVO);
	}

	@Override
	public CarInfoVO selectCarInfoByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectCarInfoByMemberNo",memberNo);
	}

}
