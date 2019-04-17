package com.aroundog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.aroundog.model.service.FreeBoardService;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService freeBoardService;
	
//	public String spreadList(HttpServletRequest request) {
//		List freeBoardList=freeBoardService.selectAll();
//		request.setAttribute("freeBoardList", freeBoardList);
//		return "";
//	}
}
