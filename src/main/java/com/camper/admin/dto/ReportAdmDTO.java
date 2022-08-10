package com.camper.admin.dto;

import java.sql.Timestamp;

public class ReportAdmDTO {

	private int rp_idx;
	private String rp_content;
	private Timestamp rp_datetime;
	private String rp_id;
	private String rp_status;
	private Timestamp rp_proc_date;
	private String rp_admin;
	private String mb_id;
	private int rp_count;
	
	
	public int getRp_count() {
		return rp_count;
	}
	public void setRp_count(int rp_count) {
		this.rp_count = rp_count;
	}
	public int getRp_idx() {
		return rp_idx;
	}
	public void setRp_idx(int rp_idx) {
		this.rp_idx = rp_idx;
	}
	public String getRp_content() {
		return rp_content;
	}
	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}
	public Timestamp getRp_datetime() {
		return rp_datetime;
	}
	public void setRp_datetime(Timestamp rp_datetime) {
		this.rp_datetime = rp_datetime;
	}
	public String getRp_id() {
		return rp_id;
	}
	public void setRp_id(String rp_id) {
		this.rp_id = rp_id;
	}
	public String getRp_status() {
		return rp_status;
	}
	public void setRp_status(String rp_status) {
		this.rp_status = rp_status;
	}
	public Timestamp getRp_proc_date() {
		return rp_proc_date;
	}
	public void setRp_proc_date(Timestamp rp_proc_date) {
		this.rp_proc_date = rp_proc_date;
	}
	public String getRp_admin() {
		return rp_admin;
	}
	public void setRp_admin(String rp_admin) {
		this.rp_admin = rp_admin;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	
	// report_image
	private int ri_idx;
	private String ri_ori_name;
	private String ri_new_name;


	public int getRi_idx() {
		return ri_idx;
	}
	public void setRi_idx(int ri_idx) {
		this.ri_idx = ri_idx;
	}
	public String getRi_ori_name() {
		return ri_ori_name;
	}
	public void setRi_ori_name(String ri_ori_name) {
		this.ri_ori_name = ri_ori_name;
	}
	public String getRi_new_name() {
		return ri_new_name;
	}
	public void setRi_new_name(String ri_new_name) {
		this.ri_new_name = ri_new_name;
	}
	
	
	
	
	
}
