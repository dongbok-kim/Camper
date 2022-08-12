package com.camper.mypage.dao;

import java.util.ArrayList;

import com.camper.mypage.dto.MyBlockDTO;

public interface MyBlockDAO {

	ArrayList<MyBlockDTO> blockList(String loginId);

}
