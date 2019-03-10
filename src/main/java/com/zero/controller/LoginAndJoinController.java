package com.zero.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zero.domain.CarInfoVO;
import com.zero.domain.LicenseInfoVO;
import com.zero.domain.LoginDTO;
import com.zero.domain.MemberVO;
import com.zero.service.MemberService;
import com.zero.util.UploadFileUtils;

@Controller
public class LoginAndJoinController {

	private static final Logger logger = LoggerFactory.getLogger(LoginAndJoinController.class);

	@Autowired
	private MemberService service;

	@Resource(name = "documentUpload")
	private String documentUpload;

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public void loginPost(MemberVO vo, String type, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("login-Post");
		logger.info("vo : " + vo);
		HttpSession session = request.getSession();
		LoginDTO dto = new LoginDTO();
		Map<String, String> id = new HashMap<>();

		// 占싸깍옙占쏙옙 占쏙옙占쏙옙占쏙옙煞占쏙옙占쏙옙占쏙옙占�
		if (type.equals("kakao")) {
			id.put("kakaoId", vo.getKakaoId());
		} else {
			id.put("naverId", vo.getNaverId());
		}

		MemberVO findevo = service.selectMemberById(id);
		logger.info("findevo" + findevo);

		if (findevo == null) {
			session.setAttribute("vo", vo);
			response.sendRedirect(request.getContextPath() + "/join");

		} else {
			dto.setDriver(findevo.isDriver());
			dto.setMemberNo(findevo.getMemberNo());
			dto.setNickname(findevo.getNickname());
			dto.setPhoto(findevo.getPhoto());
			dto.setDirverEnrollment(findevo.getDirverEnrollment());
			dto.setDirverApply(findevo.getDirverApply());
			dto.setName(findevo.getName());
			session.setAttribute("driver", "user");
			session.setAttribute("vo", dto);
			response.sendRedirect(request.getContextPath() + "/nowuse/nowRouteUpload");
		}

	}

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinGet() {
		logger.info("joinGet-get");
		return "/loginAndJoin/join";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public void joinPost(MemberVO vo, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("join-Post");
		logger.info("vo : " + vo);

		int memberNo = service.insertMember(vo);

		LoginDTO dto = new LoginDTO();
		dto.setDriver(vo.isDriver());
		dto.setMemberNo(memberNo);
		dto.setNickname(vo.getNickname());
		dto.setPhoto(vo.getPhoto());
		dto.setDirverEnrollment(null);
		dto.setDirverApply(null);
		dto.setName(vo.getName());
		HttpSession session = request.getSession();
		session.setAttribute("driver", "user");
		session.setAttribute("vo", dto);
		response.sendRedirect(request.getContextPath() + "/nowuse/nowRouteUpload");
		/* return "/nowuse/nowRouteUpload"; */
	}

	@RequestMapping(value = "addDriver", method = RequestMethod.GET)
	public String addDriverGet() {
		logger.info("addDriver-get");
		return "/loginAndJoin/addDriver";
	}

	@RequestMapping(value = "addDriver", method = RequestMethod.POST)
	public void addDriverPost(Model model, HttpServletRequest request, String relationshipCarowner,
			MultipartFile licensePhoto, MultipartFile carCard, MultipartFile insuranceCard,
			HttpServletResponse response) throws IOException {
		logger.info("addDriver-post");
		logger.info("relationshipCarowner : " + relationshipCarowner);
		logger.info("licensePhoto : " + licensePhoto);
		logger.info("carCard : " + carCard);

		HttpSession session = request.getSession();
		LoginDTO dto = (LoginDTO) session.getAttribute("vo");

		String licensePhotoThumPath = UploadFileUtils.uploadFile(documentUpload, dto.getMemberNo() + "",
				licensePhoto.getOriginalFilename(), licensePhoto.getBytes());

		String carCardThumPath = UploadFileUtils.uploadFile(documentUpload, dto.getMemberNo() + "",
				carCard.getOriginalFilename(), carCard.getBytes());

		String insuranceCardThumPath = UploadFileUtils.uploadFile(documentUpload, dto.getMemberNo() + "",
				insuranceCard.getOriginalFilename(), insuranceCard.getBytes());

		MemberVO memberVO = new MemberVO();
		memberVO.setMemberNo(dto.getMemberNo());

		CarInfoVO carInfoVO = new CarInfoVO();
		carInfoVO.setMemberNo(memberVO);
		carInfoVO.setCarCard(carCardThumPath);
		carInfoVO.setInsuranceCard(insuranceCardThumPath);
		carInfoVO.setRelationshipCarowner(relationshipCarowner);

		LicenseInfoVO licenseInfoVO = new LicenseInfoVO();
		licenseInfoVO.setMemberNo(memberVO);
		licenseInfoVO.setLicensePhoto(licensePhotoThumPath);

		try {
			service.addDriverUser(carInfoVO, licenseInfoVO);
		} catch (Exception e) {
			// TODO: handle exception
			File licensePhotoFile = new File(licensePhotoThumPath);
			File carCardFile = new File(carCardThumPath);
			File insuranceCardFile = new File(insuranceCardThumPath);
			carCardFile.delete();
			licensePhotoFile.delete();
			insuranceCardFile.delete();

		}

		/* model.addAttribute("result", "등록 완료"); */
		response.sendRedirect(request.getContextPath() + "/nowuse/nowRouteUpload?result=aa");
	}

	@RequestMapping(value = "addDriverWaiting", method = RequestMethod.GET)
	public String addDriverWaitingGet() {
		logger.info("addDriverWaiting-get");
		return "/loginAndJoin/addDriverWaiting";
	}

	@ResponseBody
	@RequestMapping(value = "updateVo", method = RequestMethod.GET)
	public ResponseEntity<LoginDTO> updatevoGet(HttpServletRequest request) {
		logger.info("updatevoGet-get");
		ResponseEntity<LoginDTO> entity = null;

		try {
			HttpSession session = request.getSession();
			LoginDTO dto = (LoginDTO) session.getAttribute("vo");

			MemberVO findevo = service.selectMemberByMemberNo(dto.getMemberNo());

			dto.setDriver(findevo.isDriver());
			dto.setMemberNo(findevo.getMemberNo());
			dto.setNickname(findevo.getNickname());
			dto.setPhoto(findevo.getPhoto());
			dto.setDirverEnrollment(findevo.getDirverEnrollment());
			dto.setDirverApply(findevo.getDirverApply());
			dto.setName(findevo.getName());

			session.setAttribute("vo", dto);

			entity = new ResponseEntity<LoginDTO>(dto, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "signOut", method = RequestMethod.GET)
	public String signOutGet(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		logger.info("signOut-get");
		LoginDTO dto = (LoginDTO) session.getAttribute("vo");

		service.deletRoutByMemberNo(dto.getMemberNo());

		session.invalidate();
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {

			for (int i = 0; i < cookies.length; i++) {

				cookies[i].setMaxAge(0); // 유효시간을 0으로 설정

				response.addCookie(cookies[i]); // 응답 헤더에 추가

			}

		}

		return "redirect:/";
	}

}
