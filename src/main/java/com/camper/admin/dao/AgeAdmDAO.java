package com.camper.admin.dao;

import java.util.ArrayList;

import com.camper.admin.dto.AgeAdmDTO;

public interface AgeAdmDAO {

	int ageReg(int ma_age);

	ArrayList<AgeAdmDTO> ageList();

	AgeAdmDTO ageUpdate(int ma_idx);

	int ageUpdateForm(int ma_idx, int ma_age);


}
