package com.camper.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.mypage.dto.MyBlockDTO;

public interface MyBlockDAO {

	ArrayList<MyBlockDTO> blockList(HashMap<String, Object> params);

	int total(HashMap<String, Object> params);

}
