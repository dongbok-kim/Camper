package com.camper.chat.handler;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.camper.chat.dao.ChatDAO;
import com.camper.chat.dto.ChatDTO;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ChatHandler extends TextWebSocketHandler {

	@Autowired ChatDAO dao;
	
	private List<Map<String, Object>> users = new ArrayList<Map<String, Object>>();
	
	private String getLoginId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String loginId = (String) httpSession.get("loginId");
		
		return loginId;
	}
	
	private ChatDTO getNickname(WebSocketSession session, String mbId) {
		ChatDTO dto = new ChatDTO();
		dto.setBl_mb(getLoginId(session));
		dto.setMb_id(mbId);
		
		dto = dao.getNickname(dto);
		
		return dto;
	}
	
	private void chatJoinList(WebSocketSession wss, TextMessage message) throws Exception {
		JSONObject jsonObj = new JSONObject(message.getPayload());
		String loginId = getLoginId(wss);
		
		if (loginId != null && jsonObj.isNull("roomIdx") == false) {
			Map<String, Object> mapToSend = new HashMap<String, Object>();
			ObjectMapper objMapper = new ObjectMapper();
			int roomIdx = (int) jsonObj.get("roomIdx");
			
			ArrayList<String> list = new ArrayList<String>();
			ArrayList<ChatDTO> join = dao.getJoin(roomIdx);
			
			for (ChatDTO dto : join) {
				dto.setCg_idx(roomIdx);
				String dataId = " data-id=\"" + dto.getMb_id() + "\"";
				String spanClass = "";
				ChatDTO dtoNickname = getNickname(wss, dto.getMb_id());
				String youNickname = dtoNickname.getMb_nickname();
				String inputChkBox = "";
				
				if (dtoNickname.getMb_status().equals("탈퇴")) {
					continue;
				} else if (dtoNickname.getBl_mb() != null) {
					spanClass = "contextMenu contextMenuMember ban";
				} else {
					spanClass = "contextMenu contextMenuMember";
				}
				
				ChatDTO isCrewLeader = dao.isCrewLeader(dto);
				ChatDTO isCrew = dao.isCrew(dto);
				ChatDTO isGo = dao.isGo(dto);
				
				if (isCrew.getCnt() > 0) {
					spanClass += " icoCrew";
				} else if (isGo.getCj_go() > 0) {
					spanClass += " icoHand";
				}
				
				if (isCrewLeader != null && isCrewLeader.getMb_id().equals(loginId) && dto.getCc_crew().equals("크루원") && isCrewLeader.getCt_deadline() < 1) {
					inputChkBox = "<input type=\"checkbox\" " + (isCrew.getCnt() > 0 ? "checked=\"checked\"" : isGo.getCj_go() < 1 ? "disabled=\"disabled\"" : "") + " />";
				}
				
				list.add(
					"								<li>\r\n" + 
					"									" + inputChkBox + "<span class=\"" + spanClass + "\"" + dataId + ">" + youNickname + "</span>\r\n" + 
					"									" + (isCrewLeader != null && isCrewLeader.getMb_id().equals(loginId) && dto.getCc_crew().equals("크루원") ? "<button type=\"button\"><i class=\"xi-ban\"></i> 강퇴</button>" : "") + "\r\n" + 
					"								</li>"
				);
			}
			
			mapToSend.put("cntJoin", list.size());
			mapToSend.put("list", list);
			mapToSend.put("cntCrew", dao.getCrewCnt(roomIdx));
			
			String jsonStr = objMapper.writeValueAsString(mapToSend);
			
			wss.sendMessage(new TextMessage(jsonStr));
		}
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		JSONObject jsonObj = new JSONObject(message.getPayload());
		String loginId = getLoginId(session);
		
		if (loginId != null && jsonObj.isNull("cmd") == false && jsonObj.isNull("roomIdx") == false) {
			Map<String, Object> mapToSend = new HashMap<String, Object>();
			ObjectMapper objMapper = new ObjectMapper();
			ChatDTO dto = new ChatDTO();
			Timestamp ts = new Timestamp(new Date().getTime());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			
			String cmd = (String) jsonObj.get("cmd");
			int roomIdx = (int) jsonObj.get("roomIdx");
			
			if (cmd.equals("ENTER")) {
				mapToSend.put("cmd", cmd);
				dto.setCg_idx(roomIdx);
				dto.setMb_id((String) loginId);
				
				ArrayList<String> msgList = new ArrayList<String>();
				ArrayList<ChatDTO> msg = dao.getMsgList(dto);
				
				for (ChatDTO list : msg) {
					String mbId = list.getMb_id();
					String dateTime = sdf.format(new Date(list.getCm_datetime().getTime())).substring(5, 16);
					
					if (loginId.equals(mbId)) {
						msgList.add(
							"					<li class=\"me\">\r\n" + 
							"						<p><span class=\"dateTime\">(" + dateTime + ")</span></p>\r\n" + 
							"						<span data-idx=\"" + list.getCm_idx() + "\">" + list.getCm_content() + "</span>\r\n" + 
							"					</li>"
						);
					} else {
						String dataId = " data-id=\"" + mbId + "\"";
						String spanClass = "";
						ChatDTO dtoNickname = getNickname(session, mbId);
						String youNickname = dtoNickname.getMb_nickname();
						
						if (dtoNickname.getMb_status().equals("탈퇴")) {
							spanClass = "out";
							dataId = "";
							youNickname = "";
						} else if (dtoNickname.getBl_mb() != null) {
							spanClass = "contextMenu contextMenuMember ban";
						} else {
							spanClass = "contextMenu contextMenuMember";
						}
						
						msgList.add(
							"					<li class=\"you\">\r\n" + 
							"						<p><span class=\"" + spanClass + "\"" + dataId + ">" + youNickname + "</span>(<span class=\"dateTime\">" + dateTime + "</span>)</p>\r\n" + 
							"						<span data-idx=\"" + list.getCm_idx() + "\">" + list.getCm_content() + "</span>\r\n" + 
							"					</li>"
						);
					}
				}
				
				mapToSend.put("msgList", msgList);
				
				String jsonStr = objMapper.writeValueAsString(mapToSend);
				
				session.sendMessage(new TextMessage(jsonStr));
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("roomIdx", roomIdx);
				map.put("session", session);
				users.add(map);
				
				for (int i = 0; i < users.size(); i++) {
					Map<String, Object> mapUsers = users.get(i);
					int groupIdx = (int) mapUsers.get("roomIdx");
					WebSocketSession wss = (WebSocketSession) mapUsers.get("session");
					
					if (roomIdx == groupIdx) {
						chatJoinList(wss, message);
					}
				}
			} else if (cmd.equals("MSG_SEND")) {
				mapToSend.put("cmd", "MSG_RECEIVE");
				String msg = (String) jsonObj.get("msg");
				
				dto.setCm_content(msg);
				dto.setCm_datetime(ts);
				dto.setCg_idx(roomIdx);
				dto.setMb_id(loginId);
				
				dao.msgSend(dto);
				
				String dateTime = sdf.format(new Date(dto.getCm_datetime().getTime())).substring(5, 16);
				
				for (int i = 0; i < users.size(); i++) {
					Map<String, Object> mapUsers = users.get(i);
					int groupIdx = (int) mapUsers.get("roomIdx");
					WebSocketSession wss = (WebSocketSession) mapUsers.get("session");
					String mbId = (String) wss.getAttributes().get("loginId");
					
					if (roomIdx == groupIdx) {
						if (loginId.equals(mbId)) {
							mapToSend.put("msg", 
								"					<li class=\"me\">\r\n" + 
								"						<p><span class=\"dateTime\">(" + dateTime + ")</span></p>\r\n" + 
								"						<span data-idx=\"" + dto.getCm_idx() + "\">" + dto.getCm_content() + "</span>\r\n" + 
								"					</li>"
							);
						} else {
							String dataId = " data-id=\"" + loginId + "\"";
							String spanClass = "";
							ChatDTO dtoNickname = getNickname(wss, loginId);
							String youNickname = dtoNickname.getMb_nickname();
							
							if (dtoNickname.getMb_status().equals("탈퇴")) {
								spanClass = "out";
								dataId = "";
								youNickname = "";
							} else if (dtoNickname.getBl_mb() != null) {
								spanClass = "contextMenu contextMenuMember ban";
							} else {
								spanClass = "contextMenu contextMenuMember";
							}
							
							mapToSend.put("msg", 
								"					<li class=\"you\">\r\n" + 
								"						<p><span class=\"" + spanClass + "\"" + dataId + ">" + youNickname + "</span>(<span class=\"dateTime\">" + dateTime + "</span>)</p>\r\n" + 
								"						<span data-idx=\"" + dto.getCm_idx() + "\">" + dto.getCm_content() + "</span>\r\n" + 
								"					</li>"
							);
						}
						
						String jsonStr = objMapper.writeValueAsString(mapToSend);
						
						wss.sendMessage(new TextMessage(jsonStr));
					}
				}
			} else if (cmd.equals("MSG_NOTICE")) {
				mapToSend.put("cmd", cmd);
				int msgIdx = (int) jsonObj.get("msgIdx");
				if (msgIdx > 0) {
					dao.noticeCancel(roomIdx);
					dao.msgNotice(msgIdx);
					
					ChatDTO msg = dao.getMsgNotice(roomIdx);
					
					for (int i = 0; i < users.size(); i++) {
						Map<String, Object> mapUsers = users.get(i);
						int groupIdx = (int) mapUsers.get("roomIdx");
						WebSocketSession wss = (WebSocketSession) mapUsers.get("session");
						
						if (roomIdx == groupIdx) {
							mapToSend.put("msg", msg.getCm_content());
							
							String jsonStr = objMapper.writeValueAsString(mapToSend);
							
							wss.sendMessage(new TextMessage(jsonStr));
						}
					}
				}
			} else if (cmd.equals("CREW_BAN")) {
				mapToSend.put("cmd", cmd);
				dto.setCc_crew("크루원");
				dto.setCg_idx(roomIdx);
				dto.setMb_id((String) jsonObj.get("mb_id"));
				
				dao.crewCancel(dto);
				dao.ban(dto);
				
				for (int i = 0; i < users.size(); i++) {
					Map<String, Object> mapUsers = users.get(i);
					int groupIdx = (int) mapUsers.get("roomIdx");
					WebSocketSession wss = (WebSocketSession) mapUsers.get("session");
					String mbId = (String) wss.getAttributes().get("loginId");
					
					if (roomIdx == groupIdx) {
						if (mbId.equals(dto.getMb_id())) {
							mapToSend.put("ban", true);
							
							String jsonStr = objMapper.writeValueAsString(mapToSend);
							
							wss.sendMessage(new TextMessage(jsonStr));
						}
						
						chatJoinList(wss, message);
					}
				}
			} else if (cmd.equals("CREW_CONFIRM")) {
				mapToSend.put("cmd", cmd);
				boolean isChk = (boolean) jsonObj.get("chk");
				dto.setCc_crew("크루원");
				dto.setCg_idx(roomIdx);
				dto.setMb_id((String) jsonObj.get("mb_id"));
				
				ChatDTO isGo = dao.isGo(dto);
				if (isGo.getCj_go() > 0) {
					if (isChk == true) {
						dao.crewConfirm(dto);
					} else {
						dao.crewCancel(dto);
					}
				}
				
				for (int i = 0; i < users.size(); i++) {
					Map<String, Object> mapUsers = users.get(i);
					int groupIdx = (int) mapUsers.get("roomIdx");
					WebSocketSession wss = (WebSocketSession) mapUsers.get("session");
					
					if (roomIdx == groupIdx) {
						chatJoinList(wss, message);
					}
				}
			} else if (cmd.equals("CREW_EXPRESSION")) {
				mapToSend.put("cmd", cmd);
				boolean isChk = (boolean) jsonObj.get("chk");
				dto.setCc_crew("크루원");
				dto.setCg_idx(roomIdx);
				dto.setMb_id(loginId);
				
				if (isChk == true) {
					dto.setCj_go((byte) 1);
				} else {
					dto.setCj_go((byte) 0);
					dao.crewCancel(dto);
				}
				
				dao.crewExpression(dto);
				
				for (int i = 0; i < users.size(); i++) {
					Map<String, Object> mapUsers = users.get(i);
					int groupIdx = (int) mapUsers.get("roomIdx");
					WebSocketSession wss = (WebSocketSession) mapUsers.get("session");
					
					if (roomIdx == groupIdx) {
						chatJoinList(wss, message);
					}
				}
			} else if (cmd.equals("CREW_EXIT")) {
				mapToSend.put("cmd", cmd);
				dto.setCg_idx(roomIdx);
				dto.setMb_id(loginId);
				
				dao.crewCancel(dto);
				dao.chatJoinDel(dto);
				
				for (int i = 0; i < users.size(); i++) {
					Map<String, Object> mapUsers = users.get(i);
					int groupIdx = (int) mapUsers.get("roomIdx");
					WebSocketSession wss = (WebSocketSession) mapUsers.get("session");
					
					if (roomIdx == groupIdx) {
						chatJoinList(wss, message);
					}
				}
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		for (int i = 0; i < users.size(); i++) {
			Map<String, Object> mapUsers = users.get(i);
			WebSocketSession wss = (WebSocketSession) mapUsers.get("session");
			
			if(session.equals(wss)) {
				users.remove(mapUsers);
				break;
			}
		}
	}
	
}
