package com.camper.admin.dao;

import java.util.ArrayList;

import com.camper.admin.dto.ReportAdmDTO;

public interface ReportAdmDAO {

	ArrayList<ReportAdmDTO> reportList();

	ReportAdmDTO reportView(int rp_idx);

}
