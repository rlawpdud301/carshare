package com.zero.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zero.domain.LocationVO;
import com.zero.domain.LoginDTO;
import com.zero.domain.MemberVO;
import com.zero.domain.RouteVO;
import com.zero.service.NowuseService;

@Controller
@RequestMapping("/nowuse/*")
public class NowuseController {
	
	private static final Logger logger = LoggerFactory.getLogger(NowuseController.class);
	
	@Autowired
	private NowuseService service;
	
	@RequestMapping(value = "nowRouteUpload", method = RequestMethod.GET)
	public void nowRouteUploadGet() {
	}
	
	@RequestMapping(value = "nowRouteUpload", method = RequestMethod.POST)
	public void nowRouteUploadPost(RouteVO vo,HttpServletRequest request) {
		logger.info("nowRouteUploadPost-Post");
		logger.info("vo : "+vo);
		//로그인정보받아와야함
		HttpSession session = request.getSession();
		LoginDTO dto = (LoginDTO) session.getAttribute("vo"); 		
		logger.info("dto : "+dto);
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberNo(dto.getMemberNo());
		vo.setMemberNo(memberVO);
		
		service.insertRoute(vo);
		
	}
}
