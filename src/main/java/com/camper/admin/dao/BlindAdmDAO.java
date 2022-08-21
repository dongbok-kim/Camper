package com.camper.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.admin.dto.BlindAdmDTO;

public interface BlindAdmDAO {

	ArrayList<BlindAdmDTO> blindList();

	ArrayList<BlindAdmDTO> blindSearch(HashMap<String, String> params);

	int blindCnt(HashMap<String, Object> params);

}
