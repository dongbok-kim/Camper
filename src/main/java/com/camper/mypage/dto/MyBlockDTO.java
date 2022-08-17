package com.camper.mypage.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

// @Alias("mypgBlock")
public class MyBlockDTO {

	private int bl_idx;
	private String mb_id;
	private String bl_mb;
	private Timestamp bl_datetime;
	
	public int getBl_idx() {
		return bl_idx;
	}
	public void setBl_idx(int bl_idx) {
		this.bl_idx = bl_idx;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getBl_mb() {
		return bl_mb;
	}
	public void setBl_mb(String bl_mb) {
		this.bl_mb = bl_mb;
	}
	public Timestamp getBl_datetime() {
		return bl_datetime;
	}
	public void setBl_datetime(Timestamp bl_datetime) {
		this.bl_datetime = bl_datetime;
	}
}
