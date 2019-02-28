package com.zero.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.domain.RouteVO;
import com.zero.persistence.DriverApplyDAO;
import com.zero.persistence.RouteDAO;

@Service
public class DriverServiceImpl implements DriverService {

	@Autowired
	private RouteDAO routeDAO;

	@Override
	public List<RouteVO> findMyAround(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return routeDAO.findMyAround(map);
	}
	
}
