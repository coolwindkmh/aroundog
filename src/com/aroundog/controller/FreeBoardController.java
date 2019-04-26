package com.aroundog.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aroundog.commons.Pager;
import com.aroundog.model.domain.FreeBoard;
import com.aroundog.model.domain.FreeComment;
import com.aroundog.model.service.FreeBoardService;
import com.aroundog.model.service.FreeCommentService;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService freeBoardService;
	@Autowired
	private FreeCommentService freeCommentService;
	private Pager pager=new Pager();
	
	
	//자유게시판 페이지 가져오기
	@RequestMapping(value="/user/freeboards",method=RequestMethod.GET)
	public ModelAndView freeBoardChangePage(@RequestParam(value="currentPage", defaultValue="1" , required=false) int currentPage,HttpServletRequest request) {	
		ModelAndView mav = new ModelAndView("user/freeboard/freeboard");
		List freeboardList=freeBoardService.selectAll();
		List fcList=freeCommentService.selectAll();
		pager.init(request, freeboardList.size());
		mav.addObject("freeBoardList", freeboardList);
		mav.addObject("fcList", fcList);
		mav.addObject("pager", pager);
		return mav;
	}
	

	//자유게시판에서 글등록으로 화면 전환
	@RequestMapping(value="/freeboard/insert", method=RequestMethod.GET)
	public String insert() {		
		return "user/freeboard/regist";
	}
	
	//자유게시판 상세정보 보기  트랜잭션 처리 필요
	@RequestMapping(value="/user/freeboard/detail/{freeboard_id}", method=RequestMethod.GET)
	public ModelAndView detail(@PathVariable("freeboard_id") int freeboard_id) {
		List fcList = new ArrayList();
		freeBoardService.updateHitCnt(freeboard_id);//히트카운터 올리기
		FreeBoard freeboard=freeBoardService.select(freeboard_id);
		List allfcList=freeCommentService.selectAll();
		
		//내 보드에 댓글 골라내기 위하여
		for(int i=0;i<allfcList.size();i++) {
			FreeComment freeComment=(FreeComment)allfcList.get(i);
			if(freeComment.getFreeboard_id()==freeboard_id) {
				fcList.add(freeComment);
			}
		}	
		ModelAndView mav = new ModelAndView("user/freeboard/detail");
		mav.addObject("freeboard", freeboard);
		mav.addObject("fcList", fcList);
		return mav;
	}
	
	
	//자유게시판 상세에서 댓글 등록 후 다시 상세창으로  트랜잭션 처리 필요
	@RequestMapping(value="/user/freeboard/detail/regist/{freeboard_id}", method=RequestMethod.GET)
	public ModelAndView registAndDetail(@PathVariable("freeboard_id") int freeboard_id) {
		List fcList = new ArrayList();
		FreeBoard freeboard=freeBoardService.select(freeboard_id);
		List allfcList=freeCommentService.selectAll();
		
		//내 보드에 댓글 골라내기 위하여
		for(int i=0;i<allfcList.size();i++) {
			FreeComment freeComment=(FreeComment)allfcList.get(i);
			if(freeComment.getFreeboard_id()==freeboard_id) {
				fcList.add(freeComment);
			}
		}	
		ModelAndView mav = new ModelAndView("user/freeboard/detail");
		mav.addObject("freeboard", freeboard);
		mav.addObject("fcList", fcList);
		return mav;
	}
	
	//자유게시판 등록하기~
	@RequestMapping(value="/user/freeboard/regist", method=RequestMethod.POST)
	public String freeBoardRegist(FreeBoard freeboard) {
		freeBoardService.insert(freeboard);
		return "redirect:/user/freeboards";
	}
	

	 
	
}
