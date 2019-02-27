package com.zero.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.domain.DriverApplyDTO;

@Repository
public class DriverApplyDaoImpl implements DriverApplyDAO {

	private static final String namespace = "com.zero.mapper.DriverApplyMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DriverApplyDTO> selectDriverApplyAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectDriverApplyAll");
	}

}
