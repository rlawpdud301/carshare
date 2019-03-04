package com.zero.domain;

import java.util.Date;

public class UseInfoVO {
	private String useNo;
	private MemberVO uMemberNo;
	private MemberVO dMemberNo;
	private Date startTime;
	private Date endTime;
	private int fee;
	private String process;
	private String startAddress;
	private Double startLatitude;
	private Double startHardness;
	private String endAddress;
	private Double endLatitude;
	private Double endHardness;
	public String getUseNo() {
		return useNo;
	}
	public void setUseNo(String useNo) {
		this.useNo = useNo;
	}
	public MemberVO getuMemberNo() {
		return uMemberNo;
	}
	public void setuMemberNo(MemberVO uMemberNo) {
		this.uMemberNo = uMemberNo;
	}
	public MemberVO getdMemberNo() {
		return dMemberNo;
	}
	public void setdMemberNo(MemberVO dMemberNo) {
		this.dMemberNo = dMemberNo;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public String getStartAddress() {
		return startAddress;
	}
	public void setStartAddress(String startAddress) {
		this.startAddress = startAddress;
	}
	public Double getStartLatitude() {
		return startLatitude;
	}
	public void setStartLatitude(Double startLatitude) {
		this.startLatitude = startLatitude;
	}
	public Double getStartHardness() {
		return startHardness;
	}
	public void setStartHardness(Double startHardness) {
		this.startHardness = startHardness;
	}
	public String getEndAddress() {
		return endAddress;
	}
	public void setEndAddress(String endAddress) {
		this.endAddress = endAddress;
	}
	public Double getEndLatitude() {
		return endLatitude;
	}
	public void setEndLatitude(Double endLatitude) {
		this.endLatitude = endLatitude;
	}
	public Double getEndHardness() {
		return endHardness;
	}
	public void setEndHardness(Double endHardness) {
		this.endHardness = endHardness;
	}
	@Override
	public String toString() {
		return "UseInfo [useNo=" + useNo + ", uMemberNo=" + uMemberNo + ", dMemberNo=" + dMemberNo + ", startTime="
				+ startTime + ", endTime=" + endTime + ", fee=" + fee + ", process=" + process + ", startAddress="
				+ startAddress + ", startLatitude=" + startLatitude + ", startHardness=" + startHardness
				+ ", endAddress=" + endAddress + ", endLatitude=" + endLatitude + ", endHardness=" + endHardness + "]";
	}
	
	
}
