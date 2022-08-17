package com.camper.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.camper.admin.dto.AnswerAdmDTO;

public interface AnswerAdmDAO {

	ArrayList<AnswerAdmDTO> answerList();

	AnswerAdmDTO answerView(int in_idx);

	void updateStatus(HashMap<String, String> params);

	void answerReg(HashMap<String, String> params);

}
