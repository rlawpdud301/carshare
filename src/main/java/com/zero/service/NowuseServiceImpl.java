package com.zero.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zero.domain.RouteVO;
import com.zero.persistence.LocationDAO;
import com.zero.persistence.RouteDAO;

@Service
public class NowuseServiceImpl implements NowuseService {

	@Autowired
	private RouteDAO routDao;
	
	
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

}
