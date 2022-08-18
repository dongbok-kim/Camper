package com.camper.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.mypage.dto.MyCampingLikeDTO;

public interface MyCampingLikeDAO {

	ArrayList<MyCampingLikeDTO> myCampingLikeList(HashMap<String, Object> params);

	int total(HashMap<String, Object> params);

	ArrayList<MyCampingLikeDTO> myCampingLikeSearch(HashMap<String, Object> params);

}
