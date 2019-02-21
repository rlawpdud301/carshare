package com.zero.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zero.domain.MemberVO;
import com.zero.domain.RouteVO;
import com.zero.service.MemberService;
import com.zero.service.NowuseService;

@Controller
public class LoginAndJoinController {

	private static final Logger logger = LoggerFactory.getLogger(LoginAndJoinController.class);
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPost(MemberVO vo ,Model model) {
		logger.info("login-Post");
		logger.info("vo : "+vo);
		
		MemberVO findevo = service.selectMemberById(vo.getId());
		if (findevo==null) {
			logger.info("findevo");
			model.addAttribute("vo", vo);
			return "/loginAndJoin/join";
		}
		
		return null;
	}
}
