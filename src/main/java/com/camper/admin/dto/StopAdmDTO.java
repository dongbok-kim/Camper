package com.camper.admin.dto;

import java.sql.Date;

public class StopAdmDTO {
	
	private int ms_idx;
	private Date ms_start_date;
	private Date ms_end_date;
	private String ms_admin_id;
	private String ms_reason;
	private String mb_id;
	private String mb_name;
	private String mb_nickname;
	private int ms_count;
	
	public int getMs_idx() {
		return ms_idx;
	}
	public void setMs_idx(int ms_idx) {
		this.ms_idx = ms_idx;
	}
	public Date getMs_start_date() {
		return ms_start_date;
	}
	public void setMs_start_date(Date ms_start_date) {
		this.ms_start_date = ms_start_date;
	}
	public Date getMs_end_date() {
		return ms_end_date;
	}
	public void setMs_end_date(Date ms_end_date) {
		this.ms_end_date = ms_end_date;
	}
	public String getMs_admin_id() {
		return ms_admin_id;
	}
	public void setMs_admin_id(String ms_admin_id) {
		this.ms_admin_id = ms_admin_id;
	}
	public String getMs_reason() {
		return ms_reason;
	}
	public void setMs_reason(String ms_reason) {
		this.ms_reason = ms_reason;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getMs_count() {
		return ms_count;
	}
	public void setMs_count(int ms_count) {
		this.ms_count = ms_count;
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
	
	

}
