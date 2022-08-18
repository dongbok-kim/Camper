package com.camper.mypage.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

// @Alias("mypgInquiry")
public class MyInquiryDTO {
	
	private int in_idx;
	private String in_title;
	private Timestamp in_datetime;
	private String in_content;
	private String in_status;
	private String mb_id;
	
	public int getIn_idx() {
		return in_idx;
	}
	public void setIn_idx(int in_idx) {
		this.in_idx = in_idx;
	}
	public String getIn_title() {
		return in_title;
	}
	public void setIn_title(String in_title) {
		this.in_title = in_title;
	}
	public Timestamp getIn_datetime() {
		return in_datetime;
	}
	public void setIn_datetime(Timestamp in_datetime) {
		this.in_datetime = in_datetime;
	}
	public String getIn_content() {
		return in_content;
	}
	public void setIn_content(String in_content) {
		this.in_content = in_content;
	}
	public String getIn_status() {
		return in_status;
	}
	public void setIn_status(String in_status) {
		this.in_status = in_status;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	

}
