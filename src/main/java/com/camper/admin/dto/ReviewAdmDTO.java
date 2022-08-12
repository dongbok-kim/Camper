package com.camper.admin.dto;

import java.sql.Timestamp;

public class ReviewAdmDTO {
	
	// 캠핑장 후기
	private int cr_idx;
	private String cr_content;
	private String cr_assessment;
	private Timestamp cr_datetime;
	private String mb_id;
	private int ct_idx;
	private int ca_idx;
	private String ca_name;
	private int bb_count; // 블라인드 여부 확인을 위한 변수
	
	public int getCr_idx() {
		return cr_idx;
	}
	public void setCr_idx(int cr_idx) {
		this.cr_idx = cr_idx;
	}
	public String getCr_content() {
		return cr_content;
	}
	public void setCr_content(String cr_content) {
		this.cr_content = cr_content;
	}
	public String getCr_assessment() {
		return cr_assessment;
	}
	public void setCr_assessment(String cr_assessment) {
		this.cr_assessment = cr_assessment;
	}
	public Timestamp getCr_datetime() {
		return cr_datetime;
	}
	public void setCr_datetime(Timestamp cr_datetime) {
		this.cr_datetime = cr_datetime;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getCt_idx() {
		return ct_idx;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
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




	// 회원 후기
	private int mr_idx;
	private String mr_content;
	private String mr_assessment;
	private String mr_score;
	private Timestamp mr_datetime;
	private String mr_id;

	public int getMr_idx() {
		return mr_idx;
	}
	public void setMr_idx(int mr_idx) {
		this.mr_idx = mr_idx;
	}
	public String getMr_content() {
		return mr_content;
	}
	public void setMr_content(String mr_content) {
		this.mr_content = mr_content;
	}
	public String getMr_assessment() {
		return mr_assessment;
	}
	public void setMr_assessment(String mr_assessment) {
		this.mr_assessment = mr_assessment;
	}
	public String getMr_score() {
		return mr_score;
	}
	public void setMr_score(String mr_score) {
		this.mr_score = mr_score;
	}
	public Timestamp getMr_datetime() {
		return mr_datetime;
	}
	public void setMr_datetime(Timestamp mr_datetime) {
		this.mr_datetime = mr_datetime;
	}
	public String getMr_id() {
		return mr_id;
	}
	public void setMr_id(String mr_id) {
		this.mr_id = mr_id;
	}
	
	
	
	
	
}
