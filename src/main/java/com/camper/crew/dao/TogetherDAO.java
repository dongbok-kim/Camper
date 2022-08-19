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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// =================== 소스트리 충돌 방지 ====================================
	// 지윤 : 크루 모집글 작성, 수정	
	ArrayList<CampingDTO> campPopup();

	void crewRegForm(TogetherDTO dto);

	TogetherDTO crewUpdate(int ct_idx);

	void crewUpdateForm(TogetherDTO dto);

	void crewChatUpdate(int cg_limit, int ct_idx);

	void campingCrew(String mb_id, int ct_idx);

	void crewChatJoin(String mb_id, int cg_idx);

	void crewChatReg(TogetherDTO dto);

	int chatCnt(int ct_idx);

	int campingTotal(HashMap<String, Object> map);

	ArrayList<CampingDTO> campPopupList(HashMap<String, Object> map);


	

}
