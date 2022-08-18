package com.camper.camping.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.camping.dto.CampingDTO;

public interface CampingDAO {
	//0815 검색 추가 전 원래
	//ArrayList<CampingDTO> campingList();
	ArrayList<CampingDTO> campingList(HashMap<String, Object> map);

	CampingDTO campingView(String ca_idx);

	ArrayList<CampingDTO> campingView_review(String ca_idx);

	ArrayList<CampingDTO> campingView_together(String ca_idx);

	int campingCnt(HashMap<String, Object> map);

	ArrayList<CampingDTO> campingRecom();

	ArrayList<CampingDTO> campingRecomUser(Object mb_id);

	


}
