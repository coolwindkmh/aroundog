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
	
	
	//�����Խ��� ������ ��������
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
	

	//�����Խ��ǿ��� �۵������ ȭ�� ��ȯ
	@RequestMapping(value="/freeboard/insert", method=RequestMethod.GET)
	public String insert() {		
		return "user/freeboard/regist";
	}
	
	//�����Խ��� ������ ����  Ʈ����� ó�� �ʿ�
	@RequestMapping(value="/user/freeboard/detail/{freeboard_id}", method=RequestMethod.GET)
	public ModelAndView detail(@PathVariable("freeboard_id") int freeboard_id) {
		List fcList = new ArrayList();
		freeBoardService.updateHitCnt(freeboard_id);//��Ʈī���� �ø���
		FreeBoard freeboard=freeBoardService.select(freeboard_id);
		List allfcList=freeCommentService.selectAll();
		
		//�� ���忡 ��� ��󳻱� ���Ͽ�
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
	
	
	//�����Խ��� �󼼿��� ��� ��� �� �ٽ� ��â����  Ʈ����� ó�� �ʿ�
	@RequestMapping(value="/user/freeboard/detail/regist/{freeboard_id}", method=RequestMethod.GET)
	public ModelAndView registAndDetail(@PathVariable("freeboard_id") int freeboard_id) {
		List fcList = new ArrayList();
		FreeBoard freeboard=freeBoardService.select(freeboard_id);
		List allfcList=freeCommentService.selectAll();
		
		//�� ���忡 ��� ��󳻱� ���Ͽ�
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
	
	//�����Խ��� ����ϱ�~
	@RequestMapping(value="/user/freeboard/regist", method=RequestMethod.POST)
	public String freeBoardRegist(FreeBoard freeboard) {
		freeBoardService.insert(freeboard);
		return "redirect:/user/freeboards";
	}
	

	 
	
}
