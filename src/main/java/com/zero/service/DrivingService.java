package com.zero.service;

import com.zero.domain.UseInfoVO;

public interface DrivingService {

	UseInfoVO startDrive(UseInfoVO useInfoVO);

	void endDrive(UseInfoVO useInfoVO);
	
}
