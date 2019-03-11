package com.zero.persistence;

import com.zero.domain.CarInfoVO;
import com.zero.domain.LicenseInfoVO;

public interface LicenseInfoDAO {
	void insertLicenseInfo(LicenseInfoVO licenseInfoVO);

	LicenseInfoVO selectLicenseInfoByMemberNo(int memberNo);
}
