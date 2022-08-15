package com.camper.chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.camper.chat.dao.ChatDAO;
import com.camper.chat.dto.ChatDTO;

@Service
public class ChatService {

	@Autowired ChatDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private HttpSession session;
	
	private ChatService(HttpSession session) {
		this.session = session;
	}
	
	public ModelAndView chat(ChatDTO cg_idx) {
		ModelAndView mav = new ModelAndView("chat");
		String loginId = (String) session.getAttribute("loginId");
		String errMsg = null;
		
		if (loginId != null) {
			mav.addObject("cg_idx", cg_idx.getCg_idx());
			
			ChatDTO chat = dao.getChat(cg_idx.getCg_idx());
			mav.addObject("cg_limit", chat.getCg_limit());
			ArrayList<ChatDTO> join = dao.getJoin(cg_idx.getCg_idx());
			ChatDTO ban = dao.getBan(cg_idx.getCg_idx(), loginId);
			ChatDTO msgNotice = dao.getMsgNotice(cg_idx.getCg_idx());
			if (msgNotice != null) {
				mav.addObject("notice", msgNotice.getCm_content());
			}
			
			boolean isJoin = false;
			boolean isGo = false;
			String crew = "크루원";
			for (ChatDTO item : join) {
				if (loginId.equals(item.getMb_id()) == true) {
					isJoin = true;
					
					if (item.getCj_go() > 0) {
						isGo = true;
					}
					
					if (item.getCc_crew().equals("크루장")) {
						crew = "크루장";
					}
					
					break;
				}
			}
			
			mav.addObject("ct_idx", chat.getCt_idx());
			mav.addObject("ct_deadline", chat.getCt_deadline());
			mav.addObject("isGo", isGo);
			mav.addObject("crew", crew);
			
			if (chat.getCnt() < 1) {
				errMsg = "존재하지 않는 채팅방입니다.";
			} else if (ban != null && ban.getCj_ban() > 0) {
				errMsg = "강퇴 당했습니다.";
			} else if (isJoin == false) {
				if (chat.getCg_limit() <= join.size()) {
					errMsg = "채팅방 정원이 모두 찼습니다.";
				} else {
					dao.chatJoin(cg_idx.getCg_idx(), loginId);
				}
			}
		} else {
			errMsg = "로그인 후 이용해 주세요.";
		}
		
		if (errMsg != null) {
			mav.addObject("errMsg", errMsg);
		}
		
		return mav;
	}

	public HashMap<String, Object> crewTogetherDeadline(int ct_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", dao.crewTogetherDeadline(ct_idx));
		return map;
	}

}
