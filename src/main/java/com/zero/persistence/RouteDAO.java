package com.zero.persistence;

import com.zero.domain.RouteVO;

public interface RouteDAO {
	
	void insertRoute(RouteVO vo);

	String selectLastNo();
}
