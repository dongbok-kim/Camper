package com.camper.camping.dao;

import java.util.ArrayList;

import org.json.JSONArray;

import com.camper.camping.dto.CampingApiDTO;

public interface CampingApiDAO {

	void setCampingApi(CampingApiDTO dto);

	void apiDel(JSONArray jsonArr);

	ArrayList<CampingApiDTO> unionSelect();

	void newCamping(ArrayList<Integer> addList);

	void statusChange(ArrayList<Integer> delList);

}
