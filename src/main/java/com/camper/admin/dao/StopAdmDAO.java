package com.camper.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.admin.dto.StopAdmDTO;

public interface StopAdmDAO {

	ArrayList<StopAdmDTO> stopList();

	ArrayList<StopAdmDTO> stopPopup(String mb_id);

	void stopAdmReg(HashMap<String, String> params);

}
