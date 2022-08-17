package com.camper.admin.dto;

import org.apache.ibatis.type.Alias;

@Alias("admTitle")
public class TitleAdmDTO {
	
	private int mt_idx;
	private String mt_name;
	private int mt_count;
	private short mt_degree;
	
	public int getMt_idx() {
		return mt_idx;
	}
	public void setMt_idx(int mt_idx) {
		this.mt_idx = mt_idx;
	}
	public String getMt_name() {
		return mt_name;
	}
	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}
	public int getMt_count() {
		return mt_count;
	}
	public void setMt_count(int mt_count) {
		this.mt_count = mt_count;
	}
	public short getMt_degree() {
		return mt_degree;
	}
	public void setMt_degree(short mt_degree) {
		this.mt_degree = mt_degree;
	}

}
