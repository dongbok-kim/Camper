package com.camper.chat.dto;

import java.sql.Timestamp;

public class ChatDTO {

	//채팅그룹
	private int cg_idx;
	private short cg_limit;
	
	//채팅참여자
	private byte cj_go;
	private Timestamp cj_datetime;
	private byte cj_ban;
	
	//채팅메시지
	private int cm_idx;
	private String cm_content;
	private Timestamp cm_datetime;
	private byte cm_notice;
	
	//회원
	private String mb_id;
	private String mb_nickname;
	private String mb_status;
	
	//회원차단
	private String bl_mb;
	
	//크루모집
	private int ct_idx;
	private byte ct_deadline;
	
	//크루
	private String cc_crew;
	
	//기타
	private int cnt;
	
	public int getCg_idx() {
		return cg_idx;
	}
	public void setCg_idx(int cg_idx) {
		this.cg_idx = cg_idx;
	}
	public short getCg_limit() {
		return cg_limit;
	}
	public void setCg_limit(short cg_limit) {
		this.cg_limit = cg_limit;
	}
	public byte getCj_go() {
		return cj_go;
	}
	public void setCj_go(byte cj_go) {
		this.cj_go = cj_go;
	}
	public Timestamp getCj_datetime() {
		return cj_datetime;
	}
	public void setCj_datetime(Timestamp cj_datetime) {
		this.cj_datetime = cj_datetime;
	}
	public byte getCj_ban() {
		return cj_ban;
	}
	public void setCj_ban(byte cj_ban) {
		this.cj_ban = cj_ban;
	}
	public int getCm_idx() {
		return cm_idx;
	}
	public void setCm_idx(int cm_idx) {
		this.cm_idx = cm_idx;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public Timestamp getCm_datetime() {
		return cm_datetime;
	}
	public void setCm_datetime(Timestamp cm_datetime) {
		this.cm_datetime = cm_datetime;
	}
	public byte getCm_notice() {
		return cm_notice;
	}
	public void setCm_notice(byte cm_notice) {
		this.cm_notice = cm_notice;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_nickname() {
		return mb_nickname;
	}
	public void setMb_nickname(String mb_nickname) {
		this.mb_nickname = mb_nickname;
	}
	public String getMb_status() {
		return mb_status;
	}
	public void setMb_status(String mb_status) {
		this.mb_status = mb_status;
	}
	public String getBl_mb() {
		return bl_mb;
	}
	public void setBl_mb(String bl_mb) {
		this.bl_mb = bl_mb;
	}
	public int getCt_idx() {
		return ct_idx;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}
	public byte getCt_deadline() {
		return ct_deadline;
	}
	public void setCt_deadline(byte ct_deadline) {
		this.ct_deadline = ct_deadline;
	}
	public String getCc_crew() {
		return cc_crew;
	}
	public void setCc_crew(String cc_crew) {
		this.cc_crew = cc_crew;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}
