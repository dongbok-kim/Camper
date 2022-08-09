package com.camper.mypage.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("mypgCrew")
public class MyCrewDTO {
	
	private int ct_idx;
	private String ct_title;
	private Date ct_wish_start;
	private Date ct_wish_end;
	private byte ct_end;
	private String mb_id;
	private int ca_idx;
	private byte cc_is_join;
	private String cc_crew;
	private String ca_name;
	
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public int getCt_idx() {
		return ct_idx;
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
	public byte getCt_end() {
		return ct_end;
	}
	public void setCt_end(byte ct_end) {
		this.ct_end = ct_end;
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
	public byte getCc_is_join() {
		return cc_is_join;
	}
	public void setCc_is_join(byte cc_is_join) {
		this.cc_is_join = cc_is_join;
	}
	public String getCc_crew() {
		return cc_crew;
	}
	public void setCc_crew(String cc_crew) {
		this.cc_crew = cc_crew;
	}

}
