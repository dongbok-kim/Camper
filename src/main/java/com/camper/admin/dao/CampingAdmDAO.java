package com.camper.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.admin.dto.CampingAdmDTO;

public interface CampingAdmDAO {

	ArrayList<CampingAdmDTO> campingAdmList(HashMap<String, Object> params);

	int campingTotal(HashMap<String, Object> params);

	CampingAdmDTO campingAdmView(HashMap<String, Object> params);

	CampingAdmDTO campingAdmAPI(HashMap<String, Object> params);

	void campingAdmUpdate(HashMap<String, Object> params);

}
