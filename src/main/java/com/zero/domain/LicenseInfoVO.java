package com.zero.domain;

import java.util.Date;

public class LicenseInfoVO {
	private MemberVO memberNo;
	private String licensePhoto;
	private String licenseNo;
	private String licenseKind;
	private Date birthday;
	private Date deadline;
	private String certificationNo;
	public MemberVO getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(MemberVO memberNo) {
		this.memberNo = memberNo;
	}
	public String getLicensePhoto() {
		return licensePhoto;
	}
	public void setLicensePhoto(String licensePhoto) {
		this.licensePhoto = licensePhoto;
	}
	public String getLicenseNo() {
		return licenseNo;
	}
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}
	public String getLicenseKind() {
		return licenseKind;
	}
	public void setLicenseKind(String licenseKind) {
		this.licenseKind = licenseKind;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getCertificationNo() {
		return certificationNo;
	}
	public void setCertificationNo(String certificationNo) {
		this.certificationNo = certificationNo;
	}
	@Override
	public String toString() {
		return "LicenseInfoVO [memberNo=" + memberNo + ", licensePhoto=" + licensePhoto + ", licenseNo=" + licenseNo
				+ ", licenseKind=" + licenseKind + ", birthday=" + birthday + ", deadline=" + deadline
				+ ", certificationNo=" + certificationNo + "]";
	}

	
}
