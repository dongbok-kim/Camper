package com.camper.crew.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.camper.camping.dto.CampingDTO;
import com.camper.chat.dto.ChatDTO;
import com.camper.crew.dao.TogetherDAO;
import com.camper.crew.dto.TogetherDTO;
import com.camper.lib.dao.CommonDAO;
import com.camper.lib.dto.PageMakerDTO;
import com.camper.lib.utils.Criteria;

@Service
public class TogetherService {

	@Autowired TogetherDAO dao;
	@Autowired CommonDAO c_dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	//크루모집 리스트
	public ArrayList<TogetherDTO> list() {
		return dao.list();
	}

	//모집글 상세보기
	public TogetherDTO view(String ct_idx) {
		return dao.view(ct_idx);
	}

	//크루모집 삭제
	@Transactional
	public String crewTogetherDelete(String ct_idx, HttpSession session) {
		TogetherDTO dto = dao.view(ct_idx);
		String loginId = (String) session.getAttribute("loginId");
		int cg_idx = dto.getCg_idx();
		
		if (loginId.equals(dto.getMb_id())) {
			c_dao.blindSelf(ct_idx, loginId);
			
			dao.chatMessageDel(cg_idx);
			dao.chatJoinDel(cg_idx);
			dao.chatRoomDel(cg_idx);
		
		}
		return "redirect:/crewTogetherList.do";
		
	}

	public int crewCnt() {
		logger.info("크루목록가져오기");
		return dao.crewCnt();
	}

	public ArrayList<TogetherDTO> recom(String mb_id) {
		return dao.recom(mb_id);
	}

	public ArrayList<TogetherDTO> recom() {
		return dao.recomList();
	}

	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// =================== 소스트리 충돌 방지 ====================================
	// 지윤 : 크루 모집글 작성, 수정
	
	// 모집글 - 캠핑장 검색 팝업 - 캠핑장 리스트 불러오기
	public ModelAndView campPopup(Criteria cri, HttpSession session, HashMap<String, Object> map) {
		// 캠핑장 리스트
		ModelAndView mav = new ModelAndView("popupCamping");
		cri.setAmount(15);
		
		// 총 캠핑장 수
		int total = dao.campingTotal(map);
		mav.addObject("listCnt", total);
		map.put("listCnt", total);
		
		// 검색 결과 나올 때 선택한 값 유지
		ArrayList<String> ca_sido = (ArrayList<String>) map.get("ca_sido");
		logger.info("ca_sido : " + ca_sido);
		mav.addObject("ca_sido",ca_sido);
		
		ArrayList<String> ca_theme = (ArrayList<String>) map.get("ca_theme");
		logger.info("ca_theme : " + ca_theme);
		mav.addObject("ca_theme",ca_theme);
		
		String ca_pet = (String) map.get("ca_pet");
		String ca_name = (String) map.get("ca_name");
		
		if (ca_pet != null && !ca_pet.trim().equals("")){
			logger.info("ca_pet : " + ca_pet);
			mav.addObject("ca_pet",ca_pet);
		}
		
		if (ca_name != null && !ca_name.trim().equals("")){
			logger.info("ca_name : " + ca_name);
			mav.addObject("ca_name",ca_name);
		}
		
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		
		int pageNum = cri.getPageNum();
		
		if (pageMaker.getStartPage() < 0) {
			logger.info("startPage : "+pageMaker.getStartPage());
			pageMaker.setStartPage(1);
		}
		
		//현재 페이지가 마지막 페이지를 초과하지 못하도록 방지하는 코드
		if(pageMaker.getEndPage() > 0 && pageNum > pageMaker.getEndPage()) {
			pageNum = pageMaker.getEndPage();
			cri.setPageNum(pageNum);
		}
		
		//DAO MAPPER OFFSET
		int skip = (pageNum - 1) * cri.getAmount();
		map.put("skip", skip);
		mav.addObject("skip", skip);
		
		//DAO MAPPER LIMIT
		map.put("amount", cri.getAmount());
		
		ArrayList<CampingDTO> list = dao.campPopupList(map);
		mav.addObject("list", list);
		
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}

	
	// 크루 모집글 등록 + 채팅방 생성 + 글 작성자 : 크루장 + 채팅방 참여자 : 크루장(트랜젝션 처리)
	@Transactional(isolation = Isolation.DEFAULT)
	public ModelAndView crewRegFrom(TogetherDTO dto) {
		
		dao.crewRegForm(dto);  // 크루 모집글 등록
		String mb_id = dto.getMb_id();
		int ct_idx = dto.getCt_idx();
		int cg_limit = dto.getCt_people_cnt()*2; // 채팅방 정원 = 모집인원*2
		dto.setCg_limit((short) cg_limit);
		dao.campingCrew(mb_id, ct_idx); // 글 작성자는 크루장으로 크루 테이블에 추가
		
		dao.crewChatReg(dto); // 채팅방 생성
		int cg_idx = dto.getCg_idx();
		logger.info("cg_idx : "+cg_idx +"/"+ dto.getCg_limit());
		dao.crewChatJoin(mb_id,cg_idx); // 생성된 채팅방에 크루장(=글 작성자) 추가
		
		ModelAndView mav = new ModelAndView("crewTogetherList");
		//ModelAndView mav = new ModelAndView("crewTogetherView.do?ct_idx=");
		return mav;
	}

	
	// 크루 모집글 수정 데이터 불러오기
	public ModelAndView crewUpdate(int ct_idx, HttpSession session ) {
		
		logger.info("모집글 수정 서비스 : "+ct_idx);
		TogetherDTO dto = dao.crewUpdate(ct_idx);
		int chatCnt = dao.chatCnt(ct_idx); // 현재 채팅방 인원 수
		
		String loginId = (String) session.getAttribute("loginId");
		String mb_id = dto.getMb_id();
		String page = "main";
		
		ModelAndView mav = new ModelAndView();
		
		if(!loginId.equals(mb_id)) {
			mav.setViewName(page);
			mav.addObject("msg","본인 글만 수정할 수 있습니다.");
		} else {
			logger.info("모집글 수정 작성자 확인 : {}/{}",loginId, mb_id);
			mav.addObject("crew", dto);
			mav.addObject("chatCnt", chatCnt);
					
			logger.info("dto : "+ dto.getCa_name() +'/'+ dto.getCt_camping_type());
			
		}	
		return mav;
	}
	
	// 크루 모집글 수정하기
	@Transactional(isolation = Isolation.DEFAULT)
	public ModelAndView crewUpdateFrom(TogetherDTO dto) {
		dao.crewUpdateForm(dto);  // 크루 모집글 수정
		int ct_idx = dto.getCt_idx();
		int cg_limit = dto.getCt_people_cnt()*2; // 채팅방 정원 = 모집인원*2
		dao.crewChatUpdate(cg_limit, ct_idx);
		ModelAndView mav = new ModelAndView("crewTogetherList");
		logger.info("dto : "+ct_idx+'/'+cg_limit+'/'+dto.getCa_idx());
		//ModelAndView mav = new ModelAndView("crewTogetherView.do?ct_idx=");
		return mav;
	}
	
	// 크루 모집글 / 팝업 / 캠핑장 검색 
	

}
