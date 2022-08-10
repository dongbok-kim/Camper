package com.camper.mypage.dto;

public class MyChatDTO {

	//채팅그룹
	private int cg_idx;
	private short cg_limit;
	
	//크루모집
	private String ct_title;
	
	//기타
	private int cntJoin;//채팅참여수
	private int cntCrew;//크루모집현황수
	
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
	public String getCt_title() {
		return ct_title;
	}
	public void setCt_title(String ct_title) {
		this.ct_title = ct_title;
	}
	public int getCntJoin() {
		return cntJoin;
	}
	public void setCntJoin(int cntJoin) {
		this.cntJoin = cntJoin;
	}
	public int getCntCrew() {
		return cntCrew;
	}
	public void setCntCrew(int cntCrew) {
		this.cntCrew = cntCrew;
	}

}
