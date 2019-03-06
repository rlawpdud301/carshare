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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zero.domain.CarInfoVO;
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
	public void nowRouteUploadGet(HttpServletRequest request,String result, Model model) {
		if (result==null || result.equals("")) {
			
		}else {
			model.addAttribute("result", "등록 완료");
		}
		HttpSession session = request.getSession();
		session.setAttribute("driver", "user");
		
		/*session.setAttribute("driver", "user");*/
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
		logger.info("routeVO : "+routeVO);
		model.addAttribute("routeVO", routeVO);
		return "/nowuse/nowRouteWaiting";
	}
	@RequestMapping(value = "cancelRoute", method = RequestMethod.GET)
	public String cancelRouteGet(HttpServletRequest request, Model model) {
		logger.info("cancelRoute-get");
		HttpSession session = request.getSession();
		LoginDTO dto = (LoginDTO) session.getAttribute("vo"); 		
		logger.info("dto : "+dto);
		service.deleteRoutByRouteNo((dto.getMemberNo()+"").trim());

		return "/nowuse/nowRouteUpload";
	}
	
	@ResponseBody
	@RequestMapping(value = "waitingnowuse", method = RequestMethod.GET)
	public ResponseEntity<LoginDTO> waitingnowuseGet(HttpServletRequest request) { 
		logger.info("waitingnowuse-get");
		ResponseEntity<LoginDTO> entity = null;
		
		HttpSession session = request.getSession();
		LoginDTO dto = (LoginDTO) session.getAttribute("vo"); 
		
		try {
			if (dto == null) {
				return new ResponseEntity<LoginDTO>(HttpStatus.OK);
			}
			LoginDTO opponentInfo = service.findOpponentNo(dto.getMemberNo());
			if (opponentInfo != null) {
				entity = new ResponseEntity<LoginDTO>(opponentInfo,HttpStatus.OK);
			}else {
				LoginDTO nulldto = new LoginDTO();
				entity = new ResponseEntity<LoginDTO>(nulldto,HttpStatus.OK);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@RequestMapping(value = "waitDriver", method = RequestMethod.GET)
	public void waitDriverGet(HttpServletRequest request,Model model) { 
		logger.info("waitDriverGet-get");
		HttpSession session = request.getSession();
		LoginDTO dto = (LoginDTO) session.getAttribute("vo");
		Map<String, Object> map = service.finduseInfoanddriverinfo(dto.getMemberNo());
		
		
		MemberVO memberVO = getDriverWhere(((CarInfoVO)map.get("carInfoVO")).getMemberNo().getMemberNo());
		
		map.put("driverLatitude", memberVO.getDriverLatitude());
		map.put("driverHardness", memberVO.getDriverHardness());
		model.addAttribute("map", map);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "getDriverLocation", method = RequestMethod.GET)
	public ResponseEntity<MemberVO> getDriverLocationGet(int driverNo) { 
		logger.info("getDriverLocation-get");
		ResponseEntity<MemberVO> entity = null;
		
		
		
		try {
			MemberVO memberVO = getDriverWhere(driverNo);
			entity = new ResponseEntity<MemberVO>(memberVO,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	

	private MemberVO getDriverWhere(int memberNo) {
		// TODO Auto-generated method stub
		MemberVO memberVO = service.selectMemberByMemberNo(memberNo);		
		return memberVO;
		
	}
	
	
}
