package com.zero.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.domain.RouteVO;
import com.zero.domain.UseInfoVO;

@Repository
public class UseInfoDaoImpl implements UseInfoDAO {

	private static final String namespace = "com.zero.mapper.UseInfoMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertUseInfo(RouteVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertUseInfo",vo);
	}

	@Override
	public UseInfoVO selectUseInfoByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectUseInfoByMemberNo",memberNo);
	}

}
