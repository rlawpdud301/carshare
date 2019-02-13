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
		MemberVO m = dao.selectMemberById("test2");
		
		System.out.println(m);
	}
	
	/*@Test
	public void testinsert() {
		MemberVO vo = new MemberVO();
		vo.setId("test2");
		vo.setJumin("00000000000");
		vo.setName("이름");
		vo.setPhone("010-9999-9999");
		vo.setName("닉네임");
		
		dao.insertMember(vo);
		
		System.out.println(vo);
	}*/
	
	
	
}
