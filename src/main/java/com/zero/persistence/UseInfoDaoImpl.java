package com.zero.persistence;


import java.util.List;
import java.util.Map;

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

	@Override
	public UseInfoVO selectUseInfoByDriverNo(int driverNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectUseInfoByDriverNo",driverNo);
	}

	@Override
	public void updateUseInfo(UseInfoVO useInfoVO) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".updateUseInfo",useInfoVO);
	}

	@Override
	public void lastUupdateUseInfo(UseInfoVO useInfoVO) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".lastUupdateUseInfo",useInfoVO);
	}

	@Override
	public UseInfoVO getProcees(int driverNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getProcees",driverNo);
	}

	@Override
	public List<UseInfoVO> selectDoneUseInfoByMap(Map<String, Object> conditionMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectDoneUseInfoByMap",conditionMap);
	}

}
