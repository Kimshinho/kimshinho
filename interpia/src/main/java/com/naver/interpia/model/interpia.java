package com.naver.interpia.model;

import org.springframework.web.multipart.MultipartFile;

public class interpia {
	
	private int num;//게시글번호
	private String kor_name;//한글이름
	private String eng_name;//영문이름
	private String hanja_name;//한자이름
	private String jumin_no;// 주민번호
	private String jumin_no1;//주민 앞자리
	private String jumin_no2;//주민 뒷자리

	private String photoname;//파일이름
	private MultipartFile photoload;//원본파일이름
	private String original;//원래이름

	private String birth;// 생년월일
	private String b_year;//년
	private String b_month;// 월
	private String b_date;// 일
	private String lunarlift;//음력양력

	private String gender;// 성별
	private String marriage;// 결혼유무
	private String thirdyear;//년차
	private String wagetype;// 급여유형
	private String work;// 근무
	private String sangtae;//상태

	private String addr;// 주소
	private String addr1;//주소앞자리
	private String addr2;//주소뒷자리

	private String phone;//연락처
	private String phone1;// 앞자리
	private String phone2;// 중간자리
	private String phone3;// 뒷자리

	private String email;// 이메일
	private String grade;// 기술등급
	private String juryang;//주량
	
	
	private String select;//검색조건
	private String textfield;//검색내용
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getKor_name() {
		return kor_name;
	}
	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getHanja_name() {
		return hanja_name;
	}
	public void setHanja_name(String hanja_name) {
		this.hanja_name = hanja_name;
	}
	public String getJumin_no() {
		return jumin_no;
	}
	public void setJumin_no(String jumin_no) {
		this.jumin_no = jumin_no;
	}
	public String getJumin_no1() {
		return jumin_no1;
	}
	public void setJumin_no1(String jumin_no1) {
		this.jumin_no1 = jumin_no1;
	}
	public String getJumin_no2() {
		return jumin_no2;
	}
	public void setJumin_no2(String jumin_no2) {
		this.jumin_no2 = jumin_no2;
	}
	public String getPhotoname() {
		return photoname;
	}
	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}
	public MultipartFile getPhotoload() {
		return photoload;
	}
	public void setPhotoload(MultipartFile photoload) {
		this.photoload = photoload;
	}
	public String getOriginal() {
		return original;
	}
	public void setOriginal(String original) {
		this.original = original;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getB_year() {
		return b_year;
	}
	public void setB_year(String b_year) {
		this.b_year = b_year;
	}
	public String getB_month() {
		return b_month;
	}
	public void setB_month(String b_month) {
		this.b_month = b_month;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getLunarlift() {
		return lunarlift;
	}
	public void setLunarlift(String lunarlift) {
		this.lunarlift = lunarlift;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMarriage() {
		return marriage;
	}
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	public String getThirdyear() {
		return thirdyear;
	}
	public void setThirdyear(String thirdyear) {
		this.thirdyear = thirdyear;
	}
	public String getWagetype() {
		return wagetype;
	}
	public void setWagetype(String wagetype) {
		this.wagetype = wagetype;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getSangtae() {
		return sangtae;
	}
	public void setSangtae(String sangtae) {
		this.sangtae = sangtae;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getJuryang() {
		return juryang;
	}
	public void setJuryang(String juryang) {
		this.juryang = juryang;
	}
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getTextfield() {
		return textfield;
	}
	public void setTextfield(String textfield) {
		this.textfield = textfield;
	}
	
	
	
	
	
	
}

	
