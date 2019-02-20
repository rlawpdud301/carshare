package com.zero.persistence;

import com.zero.domain.LocationVO;

public interface LocationDAO {
	void insertLocation(LocationVO vo);
	
	LocationVO selectLocationByLocationNo(String locationNo);
	
}
