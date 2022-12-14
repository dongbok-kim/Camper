package com.camper.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.admin.dto.ReportAdmDTO;

public interface ReportAdmDAO {

	ArrayList<ReportAdmDTO> reportList(HashMap<String, Object> params);

	ReportAdmDTO reportView(int rp_idx);

	int reportUpdate(HashMap<String, String> params);

	void fileWrite(String oriFileName, String newFileName, int rp_idx);

	ArrayList<ReportAdmDTO> photoList(int rp_idx);

	ArrayList<ReportAdmDTO> reportSearch(HashMap<String, String> params);

	int reportCnt(HashMap<String, Object> params);

}
