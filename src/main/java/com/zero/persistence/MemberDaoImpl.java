package com.zero.persistence;

import java.util.Map;

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
	public MemberVO selectMemberById(Map<String, String> id) {
		return sqlSession.selectOne(namespace + ".selectMemberById",id);
		
	}

	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertMember",vo);
	}

	@Override
	public void updateDirverApply(MemberVO memberNo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".updateDirverApply",memberNo);
	}

	@Override
	public MemberVO selectMemberByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectMemberByMemberNo",memberNo);
	}

	@Override
	public void setDriverWhere(MemberVO memberVO) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".setDriverWhere",memberVO);
	}


	@Override
	public void updateMemberByMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".updateMemberByMember",memberVO);
	}

}
