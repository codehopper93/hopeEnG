package org.hope.web.admin;

import org.hope.web.admin.LoginDTO;
import org.hope.web.domain.BraaVO;
import org.hope.web.service.BraaService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
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
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Inject
	private  AdminService service;
	
	@Autowired
	BraaService braaService;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	//관리자 로그인 화면
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		if(session.getAttribute("name") != null)
			return "Home2";
		else
			return "admin/AdminLogin";
	} 
		
	//로그인 체크
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
	public void loginCheck(LoginDTO dto, HttpSession session, Model model)throws Exception {
		AdminVO vo = service.loginCheck(dto);
		if(vo == null) {
			return;
		}
		
		session.setAttribute("name", vo.getAdminNm());
		model.addAttribute("adminVO", vo);
	}
	
	//로그인 실패
	@RequestMapping(value = "/loginFail.do", method = RequestMethod.GET)
	public String loginFail(Locale locale, Model model) {
		return "admin/loginFail";
	} 
	
	//로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(Locale locale,HttpSession session, Model model, HttpServletResponse response) throws IOException {
		session.invalidate();
		return "/home";
	} 

	//관리자 문의 게시글 처리
	@RequestMapping(value="/adminBraaPage.do", method=RequestMethod.GET)
	public String braaDetailSelect(@RequestParam String bordNum, Model model) {
		BraaVO braa = braaService.selectDetailBraa(bordNum);
		model.addAttribute("braa", braa);
		return "admin/AdminBraaPage";
	}

}
