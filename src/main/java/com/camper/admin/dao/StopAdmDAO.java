package com.camper.admin.dao;

import java.util.ArrayList;

import com.camper.admin.dto.StopAdmDTO;

public interface StopAdmDAO {

	ArrayList<StopAdmDTO> stopList();

	ArrayList<StopAdmDTO> stopPopup(String mb_id);

}
