package com.controller.onlinebank;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.onlinebank.AdminDAO;
import com.dao.onlinebank.LoginDAO;
//import com.model.onlinebank.ForgotPassword;

@Controller
public class LogoutController
{
	@Autowired
	LoginDAO ldao;

	@Autowired
	AdminDAO adao;

	@RequestMapping(value="/Logout"  ) 
	public ModelAndView login(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception
	{ 
		System.out.println("asdasdasd");
		System.out.println(session.getAttribute("user")); 


		session.removeAttribute("user");
		System.out.println("asdasd");
		session.invalidate();


		return new ModelAndView("logout_success");



	}

}

