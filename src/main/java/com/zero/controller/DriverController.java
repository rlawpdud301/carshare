package com.zero.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zero.domain.LoginDTO;
import com.zero.domain.MemberVO;
import com.zero.domain.RouteVO;
import com.zero.service.DriverService;
import com.zero.service.MemberService;

@Controller
public class DriverController {
	
	private static final Logger logger = LoggerFactory.getLogger(DriverController.class);
	
	@Autowired
	private DriverService service;
	
	@ResponseBody
	@RequestMapping(value = "/driver/findaround", method = RequestMethod.GET)
	public ResponseEntity<List<RouteVO>> findaroundGet(HttpServletRequest request,Double startLatitude,Double startHardness,String howfar) { 
		logger.info("findaround-get");
		logger.info("startLatitude " + startLatitude);
		logger.info("startHardness " + startHardness);
		ResponseEntity<List<RouteVO>> entity = null;
		
		try {
			HttpSession session = request.getSession();
			String condition = (String) session.getAttribute("driver");
			LoginDTO dto = (LoginDTO) session.getAttribute("vo");
			
			Map<String, Object> map = new HashMap<>();
			map.put("startLatitude", startLatitude);
			map.put("startHardness", startHardness);			
			map.put("condition", condition); 
			map.put("howfar", (howfar+"").trim());
			
			List<RouteVO> list = service.findMyAround(map);
			logger.info("list " + list);
			logger.info("howfar -----------------------------------------" + howfar);
			/*MemberVO findevo = service.selectMemberByMemberNo(dto.getMemberNo());*/
			
			/*dto.setDriver(findevo.isDriver());
			dto.setMemberNo(findevo.getMemberNo());
			dto.setNickname(findevo.getNickname());
			dto.setPhoto(findevo.getPhoto());
			dto.setDirverEnrollment(findevo.getDirverEnrollment());
			dto.setDirverApply(findevo.getDirverApply());
			dto.setName(findevo.getName());
			
			session.setAttribute("vo", dto);*/
			
			entity = new ResponseEntity<List<RouteVO>>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

}
