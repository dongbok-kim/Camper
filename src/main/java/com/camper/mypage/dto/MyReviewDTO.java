package com.camper.mypage.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

// @Alias("mypgReview")
public class MyReviewDTO {
	
	private String ca_sido;
	private String ca_sigungu;
	private int ca_idx;
	private String ca_name;
	private String mb_nickname;
	private Date ct_wish_start;
	private Date ct_wish_end;
	private int cr_idx;
	private String cr_content;
	private String cr_assessment;
	private Timestamp cr_datetime;
	private String mb_id;
	private int ct_idx;
	private Date delAvail;
	private Date today;
	private int mr_idx;
	private String mr_assessment;
	private short mr_score;
	private String mr_content;
	private Timestamp mr_datetime;
	private String mr_id;
	
	
	public int getMr_idx() {
		return mr_idx;
	}
	public void setMr_idx(int mr_idx) {
		this.mr_idx = mr_idx;
	}
	public String getMr_assessment() {
		return mr_assessment;
	}
	public void setMr_assessment(String mr_assessment) {
		this.mr_assessment = mr_assessment;
	}
	public short getMr_score() {
		return mr_score;
	}
	public void setMr_score(short mr_score) {
		this.mr_score = mr_score;
	}
	public String getMr_content() {
		return mr_content;
	}
	public void setMr_content(String mr_content) {
		this.mr_content = mr_content;
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
	public Date getToday() {
		return today;
	}
	public void setToday(Date today) {
		this.today = today;
	}
	public Date getDelAvail() {
		return delAvail;
	}
	public void setDelAvail(Date delAvail) {
		this.delAvail = delAvail;
	}
	public int getCt_idx() {
		return ct_idx;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}
	public String getCa_sido() {
		return ca_sido;
	}
	public void setCa_sido(String ca_sido) {
		this.ca_sido = ca_sido;
	}
	public String getCa_sigungu() {
		return ca_sigungu;
	}
	public void setCa_sigungu(String ca_sigungu) {
		this.ca_sigungu = ca_sigungu;
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
	public String getMb_nickname() {
		return mb_nickname;
	}
	public void setMb_nickname(String mb_nickname) {
		this.mb_nickname = mb_nickname;
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
}
