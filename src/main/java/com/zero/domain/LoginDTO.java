package com.zero.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LoginDTO {
	private int memberNo;
	private String nickname;
	private String name;
	private String photo;
	private boolean driver;
	private Date dirverEnrollment;
	private Date dirverApply;
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	
	
	
	//EL단에서 null 값못받음 스트링을 넘겨줌
	public String getDirverEnrollment() {
		if (dirverEnrollment==null) {
			return "null";
		}
		
		return format.format(dirverEnrollment);
	}
	public void setDirverEnrollment(Date dirverEnrollment) {
		this.dirverEnrollment = dirverEnrollment;
	}
	public String getDirverApply() {
		if (dirverApply==null) {
			return "null";
		}
		return format.format(dirverApply);
	}
	public void setDirverApply(Date dirverApply) {
		this.dirverApply = dirverApply;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "LoginDTO [memberNo=" + memberNo + ", nickname=" + nickname + ", name=" + name + ", photo=" + photo
				+ ", driver=" + driver + ", dirverEnrollment=" + dirverEnrollment + ", dirverApply=" + dirverApply
				+ ", format=" + format + "]";
	}
	
	
	
	
	
	
}
