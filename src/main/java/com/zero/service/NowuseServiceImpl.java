package com.zero.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zero.domain.CarInfoVO;
import com.zero.domain.LoginDTO;
import com.zero.domain.MemberVO;
import com.zero.domain.RouteVO;
import com.zero.domain.UseInfoVO;
import com.zero.persistence.CarInfoDAO;
import com.zero.persistence.LocationDAO;
import com.zero.persistence.MemberDAO;
import com.zero.persistence.RouteDAO;
import com.zero.persistence.UseInfoDAO;

@Service
public class NowuseServiceImpl implements NowuseService {

	@Autowired
	private RouteDAO routDao;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private UseInfoDAO useInfoDAO;
	
	@Autowired
	private CarInfoDAO carInfoDAO;
	
	
	@Override
	@Transactional
	public void insertRoute(RouteVO vo) {
		// TODO Auto-generated method stub	
		String routeNo = routDao.selectLastNo();
		
		if (routeNo == null) {
			routeNo = "u0000";
		}else {
			String what = routeNo.substring(0, 1);
			int num = (Integer.parseInt(routeNo.substring(1)) + 1);
			
			routeNo = what + (String.format("%04d", num));
		}
		vo.setRouteNo(routeNo);
		routDao.insertRoute(vo);
	}


	@Override
	public RouteVO selectRoutByRouteNo(String RouteNo) {
		// TODO Auto-generated method stub
		return routDao.selectRoutByRouteNo(RouteNo);
	}


	@Override
	public void deleteRoutByRouteNo(String memberNo) {
		// TODO Auto-generated method stub
		routDao.deleteRoutByRouteNo(memberNo);
	}

	@Override
	@Transactional
	public LoginDTO findOpponentNo(int memberNo) {
		// TODO Auto-generated method stub
		RouteVO opponent = routDao.findMyRouteuseOpponentNo(memberNo);
		if (opponent == null) {
			return null;
		}
		MemberVO memberVO = memberDAO.selectMemberByMemberNo(opponent.getOpponentNo());
		if (memberVO==null) {
			return null;
		}
		routDao.deleteRoutByRouteNo((memberNo+"").trim());
		MemberVO memberVO2 = new MemberVO();
		memberVO2.setMemberNo(memberNo);
		opponent.setMemberNo(memberVO2);
		useInfoDAO.insertUseInfo(opponent);
		LoginDTO loginDTO = new LoginDTO();
		loginDTO.setMemberNo(memberVO.getMemberNo());
		loginDTO.setNickname(memberVO.getNickname());
		loginDTO.setPhoto(memberVO.getPhoto());
		return loginDTO;
	}


	@Override
	@Transactional
	public Map<String, Object> finduseInfoanddriverinfo(int memberNo) {
		// TODO Auto-generated method stub
		UseInfoVO useInfoVO = useInfoDAO.selectUseInfoByMemberNo(memberNo);
		CarInfoVO carInfoVO = carInfoDAO.selectCarInfoByMemberNo(useInfoVO.getdMemberNo().getMemberNo());
		Map<String,Object> map = new HashMap<>();
		map.put("useInfoVO", useInfoVO);
		map.put("carInfoVO", carInfoVO);
		return map;
	}


	@Override
	public MemberVO selectMemberByMemberNo(int memberNo) {
		
		return memberDAO.selectMemberByMemberNo(memberNo);
	}

}
