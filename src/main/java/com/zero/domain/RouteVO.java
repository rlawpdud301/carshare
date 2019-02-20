package com.zero.domain;

public class RouteVO {
	private String RouteNo;
	private MemberVO id;
	private String process;
	private int avgFee;
	private String startAddress;
	private Double startLatitude;
	private Double startHardness;
	private String endAddress;
	private Double endLatitude;
	private Double endHardness;
	public String getRouteNo() {
		return RouteNo;
	}
	public void setRouteNo(String routeNo) {
		RouteNo = routeNo;
	}
	public MemberVO getId() {
		return id;
	}
	public void setId(MemberVO id) {
		this.id = id;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public int getAvgFee() {
		return avgFee;
	}
	public void setAvgFee(int avgFee) {
		this.avgFee = avgFee;
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
		return "RouteVO [RouteNo=" + RouteNo + ", id=" + id + ", process=" + process + ", avgFee=" + avgFee
				+ ", startAddress=" + startAddress + ", startLatitude=" + startLatitude + ", startHardness="
				+ startHardness + ", endAddress=" + endAddress + ", endLatitude=" + endLatitude + ", endHardness="
				+ endHardness + "]";
	}
	
	
	
	
	
}
