package com.camper.crew.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.camping.dto.CampingDTO;
import com.camper.crew.dto.TogetherDTO;

public interface TogetherDAO {

	TogetherDTO view(int ct_idx);

	ArrayList<TogetherDTO> list();

	void crewTogetherDelete(String ct_idx);

	ArrayList<CampingDTO> campPopup();

	void crewRegForm(HashMap<String, String> params);


	

}
