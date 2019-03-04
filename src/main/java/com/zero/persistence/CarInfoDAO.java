package com.zero.persistence;

import com.zero.domain.CarInfoVO;

public interface CarInfoDAO {
	void insertCarInfo(CarInfoVO carInfoVO);
	CarInfoVO selectCarInfoByMemberNo(int memberNo);
}
