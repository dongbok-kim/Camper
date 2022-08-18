package com.camper.crew.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class TogetherDTO {

	//크루모집
	private int ct_idx;
	private String ct_title;
	private String ct_content;
	private short ct_people_cnt;
	private String ct_gender;
	private byte ct_age;
	private Date ct_wish_start;
	private Date ct_wish_end;
	private byte ct_tool;
	private String ct_camping_type;
	private byte ct_pet;
	private byte ct_deadline;
	private Timestamp ct_deadline_datetime;
	private byte ct_end;
	private Timestamp ct_end_datetime;
	private Timestamp ct_datetime;
	private String mb_id;
	private int ca_idx;
	
	//캠핑장
	private String ca_name;
	private String ca_img;
	private String ca_sido;
	
	//크루모집
	private String mb_nickname;
	private String mb_gender;
	private byte ma_age;
	

	
	// 채팅방 (모집글 생성 시 모집글 번호로 채팅방 생성하므로 필요함)
	private int cg_idx; // 채팅 그룹 번호
	private short cg_limit;
	
	
	private int cnt;


	public String getMb_nickname() {
		return mb_nickname;
	}
	public void setMb_nickname(String mb_nickname) {
		this.mb_nickname = mb_nickname;
	}
	public String getMb_gender() {
		return mb_gender;
	}
	public void setMb_gender(String mb_gender) {
		this.mb_gender = mb_gender;
	}
	public byte getMa_age() {
		return ma_age;
	}
	public void setMa_age(byte ma_age) {
		this.ma_age = ma_age;
	}
	public String getCa_img() {
		return ca_img;
	}
	public void setCa_img(String ca_img) {
		this.ca_img = ca_img;
	}
	public String getCa_sido() {
		return ca_sido;
	}
	public void setCa_sido(String ca_sido) {
		this.ca_sido = ca_sido;
	}
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
	public String getCt_content() {
		return ct_content;
	}
	public void setCt_content(String ct_content) {
		this.ct_content = ct_content;
	}
	public short getCt_people_cnt() {
		return ct_people_cnt;
	}
	public void setCt_people_cnt(short ct_people_cnt) {
		this.ct_people_cnt = ct_people_cnt;
	}
	public String getCt_gender() {
		return ct_gender;
	}
	public void setCt_gender(String ct_gender) {
		this.ct_gender = ct_gender;
	}
	public byte getCt_age() {
		return ct_age;
	}
	public void setCt_age(byte ct_age) {
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
	public byte getCt_tool() {
		return ct_tool;
	}
	public void setCt_tool(byte ct_tool) {
		this.ct_tool = ct_tool;
	}
	public String getCt_camping_type() {
		return ct_camping_type;
	}
	public void setCt_camping_type(String ct_camping_type) {
		this.ct_camping_type = ct_camping_type;
	}
	public byte getCt_pet() {
		return ct_pet;
	}
	public void setCt_pet(byte ct_pet) {
		this.ct_pet = ct_pet;
	}
	public byte getCt_deadline() {
		return ct_deadline;
	}
	public void setCt_deadline(byte ct_deadline) {
		this.ct_deadline = ct_deadline;
	}
	public Timestamp getCt_deadline_datetime() {
		return ct_deadline_datetime;
	}
	public void setCt_deadline_datetime(Timestamp ct_deadline_datetime) {
		this.ct_deadline_datetime = ct_deadline_datetime;
	}
	public byte getCt_end() {
		return ct_end;
	}
	public void setCt_end(byte ct_end) {
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
	

	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	
	
}
