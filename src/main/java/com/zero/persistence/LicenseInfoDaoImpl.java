package com.zero.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.domain.LicenseInfoVO;

@Repository
public class LicenseInfoDaoImpl implements LicenseInfoDAO {

	private static final String namespace = "com.zero.mapper.LicenseInfoMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertLicenseInfo(LicenseInfoVO licenseInfoVO) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertLicenseInfo",licenseInfoVO);
	}

	@Override
	public LicenseInfoVO selectLicenseInfoByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectLicenseInfoByMemberNo",memberNo);
	}

}
