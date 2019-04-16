package com.aroundog.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.HttpServletBean;

import com.aroundog.model.domain.Admin;
import com.aroundog.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//관리자 로그인 요청
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String adminLogin(Admin admin, HttpServletRequest request) {
		System.out.println("!!!!");
		Admin obj=adminService.loginCheck(admin);
		System.out.println("obj : "+obj);
		request.getSession().setAttribute("admin", obj);
		System.out.println("request : "+request);
		return "redirect:/admin/main";
	}
	
	//관리자 로그인 성공시 이동
	@RequestMapping(value="/admin/main", method=RequestMethod.GET)
	public String goMain() {
		return "admin/main/main";
	}
	
}
