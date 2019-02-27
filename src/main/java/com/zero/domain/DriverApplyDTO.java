package com.zero.domain;

public class DriverApplyDTO {
	private MemberVO memberNo;
	private MemberVO name;
	private MemberVO phone;
	private MemberVO jumin;
	private MemberVO dirverApply;
	private CarInfoVO relationshipCarowner;
	private CarInfoVO insuranceCard;
	private CarInfoVO carCard;
	private LicenseInfoVO licensePhoto;
	public MemberVO getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(MemberVO memberNo) {
		this.memberNo = memberNo;
	}
	public MemberVO getName() {
		return name;
	}
	public void setName(MemberVO name) {
		this.name = name;
	}
	public MemberVO getPhone() {
		return phone;
	}
	public void setPhone(MemberVO phone) {
		this.phone = phone;
	}
	public MemberVO getJumin() {
		return jumin;
	}
	public void setJumin(MemberVO jumin) {
		this.jumin = jumin;
	}
	public MemberVO getDirverApply() {
		return dirverApply;
	}
	public void setDirverApply(MemberVO dirverApply) {
		this.dirverApply = dirverApply;
	}
	public CarInfoVO getRelationshipCarowner() {
		return relationshipCarowner;
	}
	public void setRelationshipCarowner(CarInfoVO relationshipCarowner) {
		this.relationshipCarowner = relationshipCarowner;
	}
	public CarInfoVO getInsuranceCard() {
		return insuranceCard;
	}
	public void setInsuranceCard(CarInfoVO insuranceCard) {
		this.insuranceCard = insuranceCard;
	}
	public CarInfoVO getCarCard() {
		return carCard;
	}
	public void setCarCard(CarInfoVO carCard) {
		this.carCard = carCard;
	}
	public LicenseInfoVO getLicensePhoto() {
		return licensePhoto;
	}
	public void setLicensePhoto(LicenseInfoVO licensePhoto) {
		this.licensePhoto = licensePhoto;
	}
	@Override
	public String toString() {
		return "DriverApplyDTO [memberNo=" + memberNo + ", name=" + name + ", phone=" + phone + ", jumin=" + jumin
				+ ", dirverApply=" + dirverApply + ", relationshipCarowner=" + relationshipCarowner + ", insuranceCard="
				+ insuranceCard + ", carCard=" + carCard + ", licensePhoto=" + licensePhoto + "]";
	}
	
	
}
