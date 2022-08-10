package com.camper.login.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class LoginDTO {

	private String mb_id;
	private String mb_pw;
	private String mb_email;
	private String mb_name;
	private String mb_nickname;
	private String mb_gender;
	private String mb_sido;
	private String mb_sigungu;
	private String mb_postcode;
	private String mb_addr_default;
	private String mb_addr_detail;
	private int mb_fire;
	private String mb_grade;
	private String mb_status;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date mb_datetime;
	
	private int mt_idx;
	private int ma_idx;
	
	private int ma_age;

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_nickname() {
		return mb_nickname;
	}

	public void setMb_nickname(String mb_nickname) {
		this.mb_nickname = mb_nickname;
	}

	public String getMb_gender() {
		return mb_gender;
	}

	public void setMb_gender(String mb_gender) {
		this.mb_gender = mb_gender;
	}

	public String getMb_sido() {
		return mb_sido;
	}

	public void setMb_sido(String mb_sido) {
		this.mb_sido = mb_sido;
	}

	public String getMb_sigungu() {
		return mb_sigungu;
	}

	public void setMb_sigungu(String mb_sigungu) {
		this.mb_sigungu = mb_sigungu;
	}

	public String getMb_postcode() {
		return mb_postcode;
	}

	public void setMb_postcode(String mb_postcode) {
		this.mb_postcode = mb_postcode;
	}

	public String getMb_addr_default() {
		return mb_addr_default;
	}

	public void setMb_addr_default(String mb_addr_default) {
		this.mb_addr_default = mb_addr_default;
	}

	public String getMb_addr_detail() {
		return mb_addr_detail;
	}

	public void setMb_addr_detail(String mb_addr_detail) {
		this.mb_addr_detail = mb_addr_detail;
	}

	public int getMb_fire() {
		return mb_fire;
	}

	public void setMb_fire(int mb_fire) {
		this.mb_fire = mb_fire;
	}

	public String getMb_grade() {
		return mb_grade;
	}

	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}

	public String getMb_status() {
		return mb_status;
	}

	public void setMb_status(String mb_status) {
		this.mb_status = mb_status;
	}

	public Date getMb_datetime() {
		return mb_datetime;
	}

	public void setMb_datetime(Date mb_datetime) {
		this.mb_datetime = mb_datetime;
	}

	public int getMt_idx() {
		return mt_idx;
	}

	public void setMt_idx(int mt_idx) {
		this.mt_idx = mt_idx;
	}

	public int getMa_idx() {
		return ma_idx;
	}

	public void setMa_idx(int ma_idx) {
		this.ma_idx = ma_idx;
	}

	public int getMa_age() {
		return ma_age;
	}

	public void setMa_age(int ma_age) {
		this.ma_age = ma_age;
	}
	
	
	
}
