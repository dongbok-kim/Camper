package com.camper.admin.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class TogetherAdmDTO {

	private int ct_idx;
	private String ct_title;
	private String ct_content;
	private int ct_people_cnt;
	private String ct_gender;
	private int ct_age;
	private Date ct_wish_start;
	private Date ct_wish_end;
	private int ct_tool;
	private String ct_camping_type;
	private int ct_pet;
	private int ct_deadline;
	private Timestamp ct_deadline_datetime;
	private int ct_end;
	private Timestamp ct_end_datetime;
	private Timestamp ct_datetime;
	private String mb_id;
	private int ca_idx;
	private String ca_name;
	private int bb_count; // 블라인드 여부
	
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
	public String getCt_content() {
		return ct_content;
	}
	public void setCt_content(String ct_content) {
		this.ct_content = ct_content;
	}
	public int getCt_people_cnt() {
		return ct_people_cnt;
	}
	public void setCt_people_cnt(int ct_people_cnt) {
		this.ct_people_cnt = ct_people_cnt;
	}
	public String getCt_gender() {
		return ct_gender;
	}
	public void setCt_gender(String ct_gender) {
		this.ct_gender = ct_gender;
	}
	public int getCt_age() {
		return ct_age;
	}
	public void setCt_age(int ct_age) {
		this.ct_age = ct_age;
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
	public int getCt_tool() {
		return ct_tool;
	}
	public void setCt_tool(int ct_tool) {
		this.ct_tool = ct_tool;
	}
	public String getCt_camping_type() {
		return ct_camping_type;
	}
	public void setCt_camping_type(String ct_camping_type) {
		this.ct_camping_type = ct_camping_type;
	}
	public int getCt_pet() {
		return ct_pet;
	}
	public void setCt_pet(int ct_pet) {
		this.ct_pet = ct_pet;
	}
	public int getCt_deadline() {
		return ct_deadline;
	}
	public void setCt_deadline(int ct_deadline) {
		this.ct_deadline = ct_deadline;
	}
	public Timestamp getCt_deadline_datetime() {
		return ct_deadline_datetime;
	}
	public void setCt_deadline_datetime(Timestamp ct_deadline_datetime) {
		this.ct_deadline_datetime = ct_deadline_datetime;
	}
	public int getCt_end() {
		return ct_end;
	}
	public void setCt_end(int ct_end) {
		this.ct_end = ct_end;
	}
	public Timestamp getCt_end_datetime() {
		return ct_end_datetime;
	}
	public void setCt_end_datetime(Timestamp ct_end_datetime) {
		this.ct_end_datetime = ct_end_datetime;
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
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public int getBb_count() {
		return bb_count;
	}
	public void setBb_count(int bb_count) {
		this.bb_count = bb_count;
	}
	
	
	
}
