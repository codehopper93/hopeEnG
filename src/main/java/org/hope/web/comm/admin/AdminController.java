package org.hope.web.comm.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hope.web.domain.BraaVO;
import org.hope.web.service.BraaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {

	@Autowired
	BraaService braaService;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
		//관리자 로그인 화면
		@RequestMapping(value = "/admin", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {

			return "comm/AdminLogin";
		} 
		
		//문의 게시판 작성하기 이
		@RequestMapping(value = "/Braa1000_write.do", method = RequestMethod.GET)
		public String braaWrite() {
			return "BraaPage";
		} 



}
