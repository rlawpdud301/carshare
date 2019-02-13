package com.zero.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.domain.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDAO {

	private static final String namespace = "com.zero.mapper.MemberMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO selectMemberById(String id) {
		return sqlSession.selectOne(namespace + ".selectMemberById",id);
		
	}

}
