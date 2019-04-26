package com.aroundog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aroundog.model.domain.FreeComment;
import com.aroundog.model.service.FreeCommentService;

@Controller
public class FreeCommentController {
	@Autowired
	private FreeCommentService freeCommentService;
	
	
	//�����Խ���  ���  ����ϱ�~
	@RequestMapping(value="/user/freecomment/regist", method=RequestMethod.POST)
	public String freeBoardCommentRegist(FreeComment freeComment) {
		System.out.println("��� ����~~~~~");
		freeCommentService.insert(freeComment);
		int freeboard_id=freeComment.getFreeboard_id();
		return "redirect:/user/freeboard/detail/regist/"+freeboard_id;
	}
	
	//�����Խ���  ����� ���  ����ϱ�~
	@RequestMapping(value="/user/freecomment/add", method=RequestMethod.POST)
	public String freeBoardCommentAdd(FreeComment freeComment) {
		System.out.println("����� ��� ����");
		freeCommentService.commentAdd(freeComment);
		int freeboard_id=freeComment.getFreeboard_id();
		return "redirect:/user/freeboard/detail/regist/"+freeboard_id;
	}
}
