package com.camper.crew.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.camping.dto.CampingDTO;
import com.camper.crew.dto.TogetherDTO;

public interface TogetherDAO {

	TogetherDTO view(String ct_idx);

	ArrayList<TogetherDTO> list();

	void chatMessageDel(int cg_idx);

	void chatJoinDel(int cg_idx);

	void chatRoomDel(int cg_idx);

	ArrayList<TogetherDTO> crewRecom();

	int crewCnt();

	ArrayList<TogetherDTO> recom(String mb_id);

	ArrayList<TogetherDTO> recomList();

	ArrayList<CampingDTO> campPopup();

	void crewRegForm(HashMap<String, String> params);


	

}
