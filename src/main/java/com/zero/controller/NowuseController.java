package com.zero.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public void nowRouteUploadPost(RouteVO vo,HttpServletRequest request,HttpServletResponse response) throws IOException {
		logger.info("nowRouteUploadPost-Post");
		logger.info("vo : "+vo);

		HttpSession session = request.getSession();
		LoginDTO dto = (LoginDTO) session.getAttribute("vo"); 		
		logger.info("dto : "+dto);
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberNo(dto.getMemberNo());
		vo.setMemberNo(memberVO);
		vo.setProcess("등록");
		service.insertRoute(vo);
		response.sendRedirect(request.getContextPath()+"/nowuse/nowRouteWaiting");
		
	}
	@RequestMapping(value = "nowRouteWaiting", method = RequestMethod.GET)
	public String nowRouteWaitingGet(HttpServletRequest request, Model model) {
		logger.info("joinGet-get");
		HttpSession session = request.getSession();
		LoginDTO dto = (LoginDTO) session.getAttribute("vo"); 		
		logger.info("dto : "+dto);
		RouteVO routeVO = service.selectRoutByRouteNo((dto.getMemberNo()+"").trim());
		model.addAttribute("routeVO", routeVO);
		return "/nowuse/nowRouteWaiting";
	}
}
