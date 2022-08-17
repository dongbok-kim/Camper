package com.camper.profile.dto;

import java.sql.Date;

public class ProfileDTO {
	
	private String mb_id;
	private String mb_nickname;
	private String mb_gender;
	private int mb_fire;
	private int age;
	
	private String name;
	private String ct_title;
	private Date ct_wish_start;
	private Date ct_wish_end;
	
	
	private String mr_assessment;
	private String mr_content;
	
	private String title;
	
	private int ct_idx;
	
	private String mb_status;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getMb_status() {
		return mb_status;
	}
	public void setMb_status(String mb_status) {
		this.mb_status = mb_status;
	}
	public int getCt_idx() {
		return ct_idx;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMr_assessment() {
		return mr_assessment;
	}
	public void setMr_assessment(String mr_assessment) {
		this.mr_assessment = mr_assessment;
	}
	public String getMr_content() {
		return mr_content;
	}
	public void setMr_content(String mr_content) {
		this.mr_content = mr_content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCt_title() {
		return ct_title;
	}
	public void setCt_title(String ct_title) {
		this.ct_title = ct_title;
	}
	public Date getCt_wish_start() {
		return ct_wish_start;
	}
	public void setCt_wish_start(Date ct_wish_start) {
		this.ct_wish_start = ct_wish_start;
	}
	public Date getCt_wish_end() {
		return ct_wish_end;
	}
	public void setCt_wish_end(Date ct_wish_end) {
		this.ct_wish_end = ct_wish_end;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
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
	public int getMb_fire() {
		return mb_fire;
	}
	public void setMb_fire(int mb_fire) {
		this.mb_fire = mb_fire;
	}
	
	
	
	

}
