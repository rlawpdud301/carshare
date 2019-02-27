package com.zero.persistence;

import java.util.List;

import com.zero.domain.DriverApplyDTO;

public interface DriverApplyDAO {
	List<DriverApplyDTO> selectDriverApplyAll();
}
