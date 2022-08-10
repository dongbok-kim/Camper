package com.camper.mypage.dao;

import java.util.ArrayList;

import com.camper.mypage.dto.MyChatDTO;

public interface MyChatDAO {

	ArrayList<MyChatDTO> myChatList(String loginId);

}
