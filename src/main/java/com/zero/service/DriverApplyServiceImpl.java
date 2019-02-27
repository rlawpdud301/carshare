package com.zero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.domain.DriverApplyDTO;
import com.zero.persistence.DriverApplyDAO;

@Service
public class DriverApplyServiceImpl implements DriverApplyService {

	@Autowired
	private DriverApplyDAO driverApplyDAO;
	
	
	@Override
	public List<DriverApplyDTO> selectDriverApplyAll() {
		// TODO Auto-generated method stub
		return driverApplyDAO.selectDriverApplyAll();
	}

}
