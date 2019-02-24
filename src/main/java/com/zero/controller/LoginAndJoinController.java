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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zero.domain.LoginDTO;
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
	public void loginPost(MemberVO vo,String type,HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("login-Post");
		logger.info("vo : "+vo);
		HttpSession session = request.getSession();
		LoginDTO dto = new LoginDTO();
		Map<String, String> id = new HashMap<>();
		
		//�α��� ������߰��ɶ�����
		if (type.equals("kakao")) {
			id.put("kakaoId", vo.getKakaoId());
		}else {
			id.put("naverId", vo.getNaverId());
		}
		
		
		MemberVO findevo = service.selectMemberById(id);
		logger.info("findevo"+findevo);
		
		if (findevo==null) {
			session.setAttribute("vo", vo);
			response.sendRedirect(request.getContextPath()+"/join");
			
		}else {
			dto.setDriver(findevo.isDriver());
			dto.setMemberNo(findevo.getMemberNo());
			dto.setNickname(findevo.getNickname());
			dto.setPhoto(findevo.getPhoto());
			
			session.setAttribute("vo", dto);
			response.sendRedirect(request.getContextPath()+"/nowuse/nowRouteUpload");
		}
		
	}
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinGet() { 
		logger.info("joinGet-get");
		return "/loginAndJoin/join";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public void joinPost(MemberVO vo ,Model model,HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("join-Post");
		logger.info("vo : "+vo);
		
		int memberNo = service.insertMember(vo);

		LoginDTO dto = new LoginDTO();
		dto.setDriver(vo.isDriver());
		dto.setMemberNo(memberNo);
		dto.setNickname(vo.getNickname());
		dto.setPhoto(vo.getPhoto());
		HttpSession session = request.getSession();
		session.setAttribute("vo", dto);
		response.sendRedirect(request.getContextPath()+"/nowuse/nowRouteUpload");
		/*return "/nowuse/nowRouteUpload";*/
	}

	@RequestMapping(value = "addDriver", method = RequestMethod.GET)
	public String addDriverGet() { 
		logger.info("addDriver-get");
		return "/loginAndJoin/addDriver";
	}
	
}
