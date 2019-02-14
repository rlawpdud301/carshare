package com.zero.domain;

public class LocationVO {
	private int locationNo;
	private String address;
	private double latitude;
	private double hardness;
	
	
	
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getHardness() {
		return hardness;
	}
	public void setHardness(double hardness) {
		this.hardness = hardness;
	}
	
	public LocationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LocationVO( String address, double latitude, double hardness) {
		super();
		this.address = address;
		this.latitude = latitude;
		this.hardness = hardness;
	}
	@Override
	public String toString() {
		return "LocationVO [locationNo=" + locationNo + ", address=" + address + ", latitude=" + latitude
				+ ", hardness=" + hardness + "]";
	}
	
	
	
}
