package com.zero.persistence;

import com.zero.domain.RouteVO;
import com.zero.domain.UseInfoVO;

public interface UseInfoDAO {

	void insertUseInfo(RouteVO vo);

	UseInfoVO selectUseInfoByMemberNo(int memberNo);

	UseInfoVO selectUseInfoByDriverNo(int driverNo);
}
