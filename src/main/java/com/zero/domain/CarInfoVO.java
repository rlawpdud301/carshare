package com.zero.domain;

import java.util.Date;

public class CarInfoVO {
	private MemberVO memberNo;
	private String carName;
	private String carNumber;
	private Date insuranceDate;
	private boolean insuranceBoonean;
	private String relationshipCarowner;
	private String carOwner;
	private String insuranceCard;
	private String carCard;
	public MemberVO getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(MemberVO memberNo) {
		this.memberNo = memberNo;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	public Date getInsuranceDate() {
		return insuranceDate;
	}
	public void setInsuranceDate(Date insuranceDate) {
		this.insuranceDate = insuranceDate;
	}
	public boolean isInsuranceBoonean() {
		return insuranceBoonean;
	}
	public void setInsuranceBoonean(boolean insuranceBoonean) {
		this.insuranceBoonean = insuranceBoonean;
	}
	public String getRelationshipCarowner() {
		return relationshipCarowner;
	}
	public void setRelationshipCarowner(String relationshipCarowner) {
		this.relationshipCarowner = relationshipCarowner;
	}
	public String getCarOwner() {
		return carOwner;
	}
	public void setCarOwner(String carOwner) {
		this.carOwner = carOwner;
	}
	public String getInsuranceCard() {
		return insuranceCard;
	}
	public void setInsuranceCard(String insuranceCard) {
		this.insuranceCard = insuranceCard;
	}
	public String getCarCard() {
		return carCard;
	}
	public void setCarCard(String carCard) {
		this.carCard = carCard;
	}
	@Override
	public String toString() {
		return "LicenseInfoVO [memberNo=" + memberNo + ", carName=" + carName + ", carNumber=" + carNumber
				+ ", insuranceDate=" + insuranceDate + ", insuranceBoonean=" + insuranceBoonean
				+ ", relationshipCarowner=" + relationshipCarowner + ", carOwner=" + carOwner + ", insuranceCard="
				+ insuranceCard + ", carCard=" + carCard + "]";
	}
	
	
}
