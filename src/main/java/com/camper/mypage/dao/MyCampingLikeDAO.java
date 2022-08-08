package com.camper.mypage.dao;

import java.util.ArrayList;

import com.camper.mypage.dto.MyCampingLikeDTO;

public interface MyCampingLikeDAO {

	ArrayList<MyCampingLikeDTO> myCampingLikeList(String temporaryId);

	void myCampingLikeDelete(String idx);

}
