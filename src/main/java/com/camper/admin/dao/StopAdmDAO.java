package com.camper.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.admin.dto.StopAdmDTO;

public interface StopAdmDAO {

	ArrayList<StopAdmDTO> stopList(HashMap<String, Object> params);

	ArrayList<StopAdmDTO> stopPopup(String mb_id);

	void stopAdmReg(HashMap<String, String> params);

	void stopMbStatus(String mb_id);

	int stopCnt(HashMap<String, Object> params);

}
