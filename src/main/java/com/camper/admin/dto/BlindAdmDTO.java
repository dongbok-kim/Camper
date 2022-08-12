package com.camper.admin.dto;

import java.sql.Timestamp;

public class BlindAdmDTO {
	
	private int bb_idx;
	private String bb_relation;
	private int bb_relation_idx;
	private String bb_reason;
	private Timestamp bb_datetime;
	private String mb_id;
	
	public int getBb_idx() {
		return bb_idx;
	}
	public void setBb_idx(int bb_idx) {
		this.bb_idx = bb_idx;
	}
	public String getBb_relation() {
		return bb_relation;
	}
	public void setBb_relation(String bb_relation) {
		this.bb_relation = bb_relation;
	}
	public int getBb_relation_idx() {
		return bb_relation_idx;
	}
	public void setBb_relation_idx(int bb_relation_idx) {
		this.bb_relation_idx = bb_relation_idx;
	}
	public String getBb_reason() {
		return bb_reason;
	}
	public void setBb_reason(String bb_reason) {
		this.bb_reason = bb_reason;
	}
	public Timestamp getBb_datetime() {
		return bb_datetime;
	}
	public void setBb_datetime(Timestamp bb_datetime) {
		this.bb_datetime = bb_datetime;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	

}
