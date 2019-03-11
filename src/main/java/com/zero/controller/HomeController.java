package com.zero.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zero.domain.LoginDTO;
import com.zero.domain.MemberVO;
import com.zero.domain.RouteVO;
import com.zero.domain.UseInfoVO;
import com.zero.service.DriverService;
import com.zero.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "loginAndJoin/login"; 
	}
	
	@RequestMapping(value = "DriverHome", method = RequestMethod.GET)
	public String DriverHomeGet(HttpServletRequest request) {
		logger.info("DriverHome ----get");
		HttpSession session = request.getSession();
		session.setAttribute("driver", "driver");
		return "driver/DriverHome"; 
	}
	
	
	@RequestMapping(value = "findMyHistory", method = RequestMethod.GET)
	public void findMyHistoryGet(HttpSession session,Model model) {
		logger.info("findMyHistory ----get");
		LoginDTO dto = (LoginDTO) session.getAttribute("vo");
		
		
		Map<String, Object> map = service.findHistory(dto.getMemberNo());
		
		model.addAttribute("map", map);		

	}
	
	@ResponseBody
	@RequestMapping(value = "getMemberInfo", method = RequestMethod.GET)
	public ResponseEntity<LoginDTO> getMemberInforGet(int memberNo) { 
		logger.info("getMemberInfo-get");
		ResponseEntity<LoginDTO> entity = null;
		
		try {
			MemberVO memberVO = service.selectMemberByMemberNo(memberNo);
			
			LoginDTO loginDTO = new LoginDTO();
			loginDTO.setNickname(memberVO.getNickname());
			loginDTO.setPhoto(memberVO.getPhoto());
			
			logger.info("loginDTO------------------------" + loginDTO);
			entity = new ResponseEntity<LoginDTO>(loginDTO,HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "favorRout", method = RequestMethod.GET)
	public void favorRoutGet(HttpSession session,Model model) {
		logger.info("favorRout ----get");
		LoginDTO dto = (LoginDTO) session.getAttribute("vo");

		Map<String, Object> map = service.findMyfavorRout(dto.getMemberNo());
		
		model.addAttribute("map", map);		

	}
	
	@RequestMapping(value = "readFavor", method = RequestMethod.GET)
	public void readFavorGet(HttpSession session,Model model,String routeNo) {
		logger.info("readFavor ----get");
		LoginDTO dto = (LoginDTO) session.getAttribute("vo");

		RouteVO routeVO = service.selectRouteByRoutNo(routeNo);
		
		model.addAttribute("routeVO", routeVO);		

	}
	
	@RequestMapping(value = "removeFavorRout", method = RequestMethod.GET)
	public String removeFavorRoutGet(String routeNo) {
		logger.info("removeFavorRout ----get");
		
		service.removeFavorRouteByRouteNo(routeNo); 

		return "redirect:/favorRout"; 
	}
	
	
}
