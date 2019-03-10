package com.zero.persistence;

import java.util.List;
import java.util.Map;

import com.zero.domain.RouteVO;
import com.zero.domain.UseInfoVO;

public interface UseInfoDAO {

	void insertUseInfo(RouteVO vo);

	UseInfoVO selectUseInfoByMemberNo(int memberNo);

	UseInfoVO selectUseInfoByDriverNo(int driverNo);

	void updateUseInfo(UseInfoVO useInfoVO);

	void lastUupdateUseInfo(UseInfoVO useInfoVO);

	UseInfoVO getProcees(int driverNo);

	List<UseInfoVO> selectDoneUseInfoByMap(Map<String, Object> conditionMap);

	

}
