package com.camper.admin.dto;

import java.sql.Timestamp;

public class AnswerAdmDTO {
	
	//문의글
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
	
	
	// 답변
	private int ia_idx;
	private String ia_content;
	private Timestamp ia_datetime;
	private String ia_admin; //답변 관리자 아이디 (답변 테이블의 mb_id)
	
	public int getIa_idx() {
		return ia_idx;
	}
	public void setIa_idx(int ia_idx) {
		this.ia_idx = ia_idx;
	}
	public String getIa_content() {
		return ia_content;
	}
	public void setIa_content(String ia_content) {
		this.ia_content = ia_content;
	}
	public Timestamp getIa_datetime() {
		return ia_datetime;
	}
	public void setIa_datetime(Timestamp ia_datetime) {
		this.ia_datetime = ia_datetime;
	}
	public String getIa_admin() {
		return ia_admin;
	}
	public void setIa_admin(String ia_admin) {
		this.ia_admin = ia_admin;
	}
	
	
	
}
