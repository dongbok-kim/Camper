package com.camper.camping.dto;
import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;


public class CampingDTO {

	private int ca_idx;
	private String ca_name;
	private String ca_intro;
	private String ca_manage_status;
	private Date ca_rest_start;
	private Date ca_rest_end;
	private String ca_induty;
	private String ca_sido;
	private String ca_sigungu;
	private String ca_postcode;
	private String ca_addr_default;
	private String ca_addr_detail;
	private double ca_mapX;
	private double ca_mapY;
	private String ca_tel;
	private String ca_oper_period;
	private String ca_oper_date;
	private String ca_fire_cnt;
	private String ca_sub_facility;
	private String ca_possibilty;
	private String ca_environment;
	private String ca_theme;
	private String ca_tool;
	private String ca_pet;
	private String ca_img;
	private Timestamp ca_create_date;
	private Timestamp ca_modified_date;
	
	//리뷰, 좋아요 수
	private int cntLike;
	private int cntReview;
	
	//크루모집 리스트
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
	
	//리뷰리스트
	private int cr_idx;
	private String cr_content;
	private String cr_assessment;
	private Timestamp cr_datetime;
	
	
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
	public int getCntLike() {
		return cntLike;
	}
	public void setCntLike(int cntLike) {
		this.cntLike = cntLike;
	}
	public int getCntReview() {
		return cntReview;
	}
	public void setCntReview(int cntReview) {
		this.cntReview = cntReview;
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
	public String getCa_intro() {
		return ca_intro;
	}
	public void setCa_intro(String ca_intro) {
		this.ca_intro = ca_intro;
	}
	public String getCa_manage_status() {
		return ca_manage_status;
	}
	public void setCa_manage_status(String ca_manage_status) {
		this.ca_manage_status = ca_manage_status;
	}
	public Date getCa_rest_start() {
		return ca_rest_start;
	}
	public void setCa_rest_start(Date ca_rest_start) {
		this.ca_rest_start = ca_rest_start;
	}
	public Date getCa_rest_end() {
		return ca_rest_end;
	}
	public void setCa_rest_end(Date ca_rest_end) {
		this.ca_rest_end = ca_rest_end;
	}
	public String getCa_induty() {
		return ca_induty;
	}
	public void setCa_induty(String ca_induty) {
		this.ca_induty = ca_induty;
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
	public String getCa_postcode() {
		return ca_postcode;
	}
	public void setCa_postcode(String ca_postcode) {
		this.ca_postcode = ca_postcode;
	}
	public String getCa_addr_default() {
		return ca_addr_default;
	}
	public void setCa_addr_default(String ca_addr_default) {
		this.ca_addr_default = ca_addr_default;
	}
	public String getCa_addr_detail() {
		return ca_addr_detail;
	}
	public void setCa_addr_detail(String ca_addr_detail) {
		this.ca_addr_detail = ca_addr_detail;
	}
	public double getCa_mapX() {
		return ca_mapX;
	}
	public void setCa_mapX(double ca_mapX) {
		this.ca_mapX = ca_mapX;
	}
	public double getCa_mapY() {
		return ca_mapY;
	}
	public void setCa_mapY(double ca_mapY) {
		this.ca_mapY = ca_mapY;
	}
	public String getCa_tel() {
		return ca_tel;
	}
	public void setCa_tel(String ca_tel) {
		this.ca_tel = ca_tel;
	}
	public String getCa_oper_period() {
		return ca_oper_period;
	}
	public void setCa_oper_period(String ca_oper_period) {
		this.ca_oper_period = ca_oper_period;
	}
	public String getCa_oper_date() {
		return ca_oper_date;
	}
	public void setCa_oper_date(String ca_oper_date) {
		this.ca_oper_date = ca_oper_date;
	}
	public String getCa_fire_cnt() {
		return ca_fire_cnt;
	}
	public void setCa_fire_cnt(String ca_fire_cnt) {
		this.ca_fire_cnt = ca_fire_cnt;
	}
	public String getCa_sub_facility() {
		return ca_sub_facility;
	}
	public void setCa_sub_facility(String ca_sub_facility) {
		this.ca_sub_facility = ca_sub_facility;
	}
	public String getCa_possibilty() {
		return ca_possibilty;
	}
	public void setCa_possibilty(String ca_possibilty) {
		this.ca_possibilty = ca_possibilty;
	}
	public String getCa_environment() {
		return ca_environment;
	}
	public void setCa_environment(String ca_environment) {
		this.ca_environment = ca_environment;
	}
	public String getCa_theme() {
		return ca_theme;
	}
	public void setCa_theme(String ca_theme) {
		this.ca_theme = ca_theme;
	}
	public String getCa_tool() {
		return ca_tool;
	}
	public void setCa_tool(String ca_tool) {
		this.ca_tool = ca_tool;
	}
	public String getCa_pet() {
		return ca_pet;
	}
	public void setCa_pet(String ca_pet) {
		this.ca_pet = ca_pet;
	}
	public String getCa_img() {
		return ca_img;
	}
	public void setCa_img(String ca_img) {
		this.ca_img = ca_img;
	}
	public Timestamp getCa_create_date() {
		return ca_create_date;
	}
	public void setCa_create_date(Timestamp ca_create_date) {
		this.ca_create_date = ca_create_date;
	}
	public Timestamp getCa_modified_date() {
		return ca_modified_date;
	}
	public void setCa_modified_date(Timestamp ca_modified_date) {
		this.ca_modified_date = ca_modified_date;
	}
	
	
	
	
}
