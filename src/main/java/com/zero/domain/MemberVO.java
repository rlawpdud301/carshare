package com.zero.domain;

public class MemberVO {
	private String id;
	private String uIntro;
	private String dIntro;
	private String phone;
	private String nikname;
	private String photo;
	private String jop;
	private boolean driver;
	private String gradeNo;
	private int myFee;
	
	
	
	public MemberVO(String id, String uIntro, String dIntro, String phone, String nikname, String photo, String jop,
			boolean driver, String gradeNo, int myFee) {
		super();
		this.id = id;
		this.uIntro = uIntro;
		this.dIntro = dIntro;
		this.phone = phone;
		this.nikname = nikname;
		this.photo = photo;
		this.jop = jop;
		this.driver = driver;
		this.gradeNo = gradeNo;
		this.myFee = myFee;
	}



	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getNikname() {
		return nikname;
	}
	public void setNikname(String nikname) {
		this.nikname = nikname;
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



	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", uIntro=" + uIntro + ", dIntro=" + dIntro + ", phone=" + phone + ", nikname="
				+ nikname + ", photo=" + photo + ", jop=" + jop + ", driver=" + driver + ", gradeNo=" + gradeNo
				+ ", myFee=" + myFee + "]";
	}

	
	
	
	
	
}
