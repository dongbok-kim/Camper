package com.camper.mypage.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

// @Alias("mypgMyTogether")
public class MyTogetherDTO {
	
	private int ct_idx;
	private String ct_title;
	private short ct_people_cnt;
	private Timestamp ct_datetime;
	private String mb_id;
	private int ca_idx;
	private int nowCnt;
	
	public int getCt_idx() {
		return ct_idx;
	}
	public int getNowCnt() {
		return nowCnt;
	}
	public void setNowCnt(int nowCnt) {
		this.nowCnt = nowCnt;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}
	public String getCt_title() {
		return ct_title;
	}
	public void setCt_title(String ct_title) {
		this.ct_title = ct_title;
	}
	public short getCt_people_cnt() {
		return ct_people_cnt;
	}
	public void setCt_people_cnt(short ct_people_cnt) {
		this.ct_people_cnt = ct_people_cnt;
	}
	public Timestamp getCt_datetime() {
		return ct_datetime;
	}
	public void setCt_datetime(Timestamp ct_datetime) {
		this.ct_datetime = ct_datetime;
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
