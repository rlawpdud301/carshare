package com.zero.carshare;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zero.domain.LocationVO;
import com.zero.domain.MemberVO;
import com.zero.persistence.LocationDAO;
import com.zero.persistence.MemberDAO;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DaoTest {
	
	@Autowired
	private MemberDAO Memberdao;
	
	@Autowired
	private LocationDAO Locationdao;
		
	/*@Test
	public void testselectMemberById() {
		MemberVO m = Memberdao.selectMemberById("test2");
		
		System.out.println(m);
	}*/
	
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
	/*@Test
	public void testinsertLocation() {
		LocationVO vo = new LocationVO();
		vo.setAddress("우리길 70길11");
		vo.setHardness(33.350701);
		vo.setLatitude(126.370667);
		Locationdao.insertLocation(vo);
	}*/
	
	@Test
	public void testselectLocation() {
		LocationVO vo = new LocationVO();
		vo.setAddress("우리길 70길11");
		Locationdao.selectLocation(vo);
	}
	
	@Test
	public void testselectLocation2() {
		LocationVO vo = new LocationVO();
		vo.setLocationNo(1);
		Locationdao.selectLocation(vo);
	}
	
}
