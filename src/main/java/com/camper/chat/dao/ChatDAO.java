package com.camper.chat.dao;

import java.util.ArrayList;

import com.camper.chat.dto.ChatDTO;

public interface ChatDAO {

	ChatDTO getChat(int cg_idx);

	ArrayList<ChatDTO> getJoin(int cg_idx);

	ChatDTO getBan(int cg_idx, String loginId);

	void chatJoin(int cg_idx, String loginId);

	int msgSend(ChatDTO dto);

	void noticeCancel(int cg_idx);

	void msgNotice(int cm_idx);

	ChatDTO getMsgNotice(int cg_idx);

	void ban(ChatDTO dto);

	ChatDTO isGo(ChatDTO dto);

	void crewConfirm(ChatDTO dto);

	void crewCancel(ChatDTO dto);

	void crewExpression(ChatDTO dto);

	void chatJoinDel(ChatDTO dto);

	ChatDTO getNickname(ChatDTO dto);

	int getCrewCnt(int cg_idx);

	ChatDTO isCrew(ChatDTO dto);

	ChatDTO isCrewLeader(ChatDTO dto);

	ArrayList<ChatDTO> getMsgList(ChatDTO dto);

	int crewTogetherDeadline(int ct_idx);

}
