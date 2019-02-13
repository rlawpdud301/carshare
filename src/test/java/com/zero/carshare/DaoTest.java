package com.zero.carshare;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zero.domain.MemberVO;
import com.zero.persistence.MemberDAO;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DaoTest {
	
	@Autowired
	private MemberDAO dao;
		
	@Test
	public void testselectMemberById() {
		System.out.println("aaaa");
		MemberVO m = dao.selectMemberById("test");
		
		System.out.println(m);
	}
	
	
	
	
	
}
