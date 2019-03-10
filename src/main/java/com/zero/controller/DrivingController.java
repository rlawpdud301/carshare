package com.zero.controller;

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

import com.zero.domain.LoginDTO;
import com.zero.domain.MemberVO;
import com.zero.domain.UseInfoVO;
import com.zero.service.DriverService;
import com.zero.service.DrivingService;

@Controller
public class DrivingController {
	private static final Logger logger = LoggerFactory.getLogger(DrivingController.class);
	
	@Autowired
	private DrivingService service;
	
	@RequestMapping(value = "/driving/startDrive", method = RequestMethod.GET)
	public void startDriveGet(HttpSession session, Model model ,double lat,double lon ) { 
		
		
		logger.info("startDrive-get");
		
		logger.info("lat---------------------------"+lat +"lon----------------------"+lon);
		LoginDTO dto = (LoginDTO) session.getAttribute("vo");
		UseInfoVO useInfoVO = new UseInfoVO();
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberNo(dto.getMemberNo());
		useInfoVO.setdMemberNo(memberVO);
		useInfoVO.setStartAddress("");
		useInfoVO.setStartLatitude(lat);
		useInfoVO.setStartHardness(lon);
		useInfoVO = service.startDrive(useInfoVO);
		model.addAttribute("useInfoVO", useInfoVO);
		
	}
	
	@RequestMapping(value = "/driving/goHome", method = RequestMethod.GET)
	public String goHomeGet(HttpSession session ,double lat,double lon,int fee,String endAddress ) { 
		
		
		logger.info("goHome-get");
		
		logger.info("lat---------------------------"+lat +"lon----------------------"+lon);
		LoginDTO dto = (LoginDTO) session.getAttribute("vo");
		UseInfoVO useInfoVO = new UseInfoVO();
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberNo(dto.getMemberNo());
		useInfoVO.setdMemberNo(memberVO);
		useInfoVO.setEndAddress(endAddress);
		useInfoVO.setEndLatitude(lat);
		useInfoVO.setEndHardness(lon);
		useInfoVO.setFee(fee);
		service.endDrive(useInfoVO);
		
		return "driver/DriverHome"; 
	}
}
