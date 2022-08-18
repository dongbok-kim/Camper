package com.camper.crew.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.camping.dto.CampingDTO;
import com.camper.crew.dto.TogetherDTO;

public interface TogetherDAO {

	TogetherDTO view(int ct_idx);

	ArrayList<TogetherDTO> list();

	void crewTogetherDelete(String ct_idx);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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


	

}
