package com.camper.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.admin.dto.TogetherAdmDTO;

public interface TogetherAdmDAO {

	ArrayList<TogetherAdmDTO> togetherList();

	TogetherAdmDTO togetherView(int ct_idx);

	ArrayList<TogetherAdmDTO> togetherList(HashMap<String, Object> params);

	int togetherCnt(HashMap<String, Object> params);

}
