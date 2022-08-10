package com.camper.camping.dao;

import java.util.ArrayList;

import com.camper.camping.dto.CampingDTO;

public interface CampingDAO {

	ArrayList<CampingDTO> campingList();

	CampingDTO campingView(String ca_idx);

	CampingDTO campingView_review(String ca_idx);

	CampingDTO campingView_together(String ca_idx);

}
