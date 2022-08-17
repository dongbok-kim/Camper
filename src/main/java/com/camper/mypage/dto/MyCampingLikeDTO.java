package com.camper.mypage.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

// @Alias("mypgLike")
public class MyCampingLikeDTO {
	
	private int cl_idx;
	private Timestamp cl_datetime;
	private String mb_id;
	private int ca_idx;
	private String ca_name;
	
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public int getCl_idx() {
		return cl_idx;
	}
	public void setCl_idx(int cl_idx) {
		this.cl_idx = cl_idx;
	}
	public Timestamp getCl_datetime() {
		return cl_datetime;
	}
	public void setCl_datetime(Timestamp cl_datetime) {
		this.cl_datetime = cl_datetime;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getCa_idx() {
		return ca_idx;
	}
	public void setCa_idx(int ca_idx) {
		this.ca_idx = ca_idx;
	}
	
	

}
