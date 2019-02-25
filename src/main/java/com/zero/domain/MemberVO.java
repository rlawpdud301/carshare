package com.zero.domain;

import java.util.Date;

public class MemberVO {
	private int memberNo;
	private String kakaoId;
	private String naverId;
	private String jumin;
	private String name;
	private String uIntro;
	private String dIntro;
	private String phone;
	private String nickname;
	private String photo;
	private String jop;
	private boolean driver;
	private String gradeNo;
	private int myFee;
	private String email;
	private Date dirverEnrollment;
	private Date dirverApply;
	
	
	
	

	

	public Date getDirverEnrollment() {
		return dirverEnrollment;
	}



	public void setDirverEnrollment(Date dirverEnrollment) {
		this.dirverEnrollment = dirverEnrollment;
	}



	public Date getDirverApply() {
		return dirverApply;
	}



	public void setDirverApply(Date dirverApply) {
		this.dirverApply = dirverApply;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getJumin() {
		return jumin;
	}



	public void setJumin(String jumin) {
		this.jumin = jumin;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}

	
	
	



	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public String getKakaoId() {
		return kakaoId;
	}



	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}



	public String getNaverId() {
		return naverId;
	}



	public void setNaverId(String naverId) {
		this.naverId = naverId;
	}



	public String getuIntro() {
		return uIntro;
	}



	public void setuIntro(String uIntro) {
		this.uIntro = uIntro;
	}



	public String getdIntro() {
		return dIntro;
	}



	public void setdIntro(String dIntro) {
		this.dIntro = dIntro;
	}



	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getJop() {
		return jop;
	}
	public void setJop(String jop) {
		this.jop = jop;
	}
	
	public String getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(String gradeNo) {
		this.gradeNo = gradeNo;
	}

	public boolean isDriver() {
		return driver;
	}

	public void setDriver(boolean driver) {
		this.driver = driver;
	}

	public int getMyFee() {
		return myFee;
	}

	public void setMyFee(int myFee) {
		this.myFee = myFee;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	@Override
	public String toString() {
		return "MemberVO [memberNo=" + memberNo + ", kakaoId=" + kakaoId + ", naverId=" + naverId + ", jumin=" + jumin
				+ ", name=" + name + ", uIntro=" + uIntro + ", dIntro=" + dIntro + ", phone=" + phone + ", nickname="
				+ nickname + ", photo=" + photo + ", jop=" + jop + ", driver=" + driver + ", gradeNo=" + gradeNo
				+ ", myFee=" + myFee + ", email=" + email + ", dirverEnrollment=" + dirverEnrollment + ", dirverApply="
				+ dirverApply + "]";
	}



	



	





	


	



	
	
	
	
	
	
}
