package com.camper.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.admin.dto.ReviewAdmDTO;

public interface ReviewAdmDAO {

	int reviewTotal(HashMap<String, Object> params);

	ArrayList<ReviewAdmDTO> reviewCampList(HashMap<String, Object> params);

	ArrayList<ReviewAdmDTO> reviewMemberList();

}
