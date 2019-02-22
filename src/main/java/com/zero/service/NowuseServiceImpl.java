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
		String RouteNo = routDao.selectLastNo();
		if (RouteNo == null) {
			RouteNo = "u0001";
		}
		vo.setRouteNo(RouteNo);
		routDao.insertRoute(vo);
	}

}
