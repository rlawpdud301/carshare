package com.zero.domain;

public class LoginDTO {
	private int memberNo;
	private String nickname;
	private String photo;
	private boolean driver;
	
	
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public boolean isDriver() {
		return driver;
	}
	public void setDriver(boolean driver) {
		this.driver = driver;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "LoginDTO [memberNo=" + memberNo + ", nickname=" + nickname + ", photo=" + photo + ", driver=" + driver
				+ "]";
	}
	
	
	
	
}
