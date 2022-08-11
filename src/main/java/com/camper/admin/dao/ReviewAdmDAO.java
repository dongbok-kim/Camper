package com.camper.admin.dao;

import java.util.ArrayList;

import com.camper.admin.dto.ReviewAdmDTO;

public interface ReviewAdmDAO {

	ArrayList<ReviewAdmDTO> reviewCampList();

	ArrayList<ReviewAdmDTO> reviewMemberList();

}
