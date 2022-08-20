package com.camper.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.admin.dto.TitleAdmDTO;

public interface TitleAdmDAO {

	ArrayList<TitleAdmDTO> titleList();

	void titleAdd(HashMap<String, String> params);

	TitleAdmDTO titleUpdateForm(String idx);

	void titleUpdate(HashMap<String, String> params);

	ArrayList<TitleAdmDTO> getTitleIdx();

	void memberUpdate(int mt_idx);

	int chkDuple(HashMap<String, String> params);

	int chkUpdateDuple(HashMap<String, String> params);

	int total(HashMap<String, Object> params);

}
