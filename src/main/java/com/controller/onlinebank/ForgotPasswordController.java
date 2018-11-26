package com.controller.onlinebank;

import java.util.List;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.onlinebank.BeneficiaryDetailsDAO;
import com.dao.onlinebank.ForgotPasswordDAO;
import com.model.onlinebank.Customer;
import com.model.onlinebank.ForgotPassword;
@ Controller
public class ForgotPasswordController {
	@Autowired
	ForgotPasswordDAO cdao;
	@RequestMapping("/forgotPassword")
	public ModelAndView forgotPassword(HttpServletRequest request, HttpServletResponse response, @ModelAttribute ForgotPassword f) {
		System.out.println(f.getCustID());
		System.out.println(f.getAnswer());
		List<Customer> lst= cdao.forgotPassword(f);
		ModelAndView mv=new ModelAndView();
		if(lst.size()>0)
		{
			Customer c=lst.get(0);
			System.out.println(c.getAns1());
			System.out.println(f.getAnswer());
			if(c.getAns1().equalsIgnoreCase(f.getAnswer())) {
				//				return new ModelAndView("changePassword","message",f);
				mv.setViewName("changePassword");
				mv.addObject("message", f);
			}
			else
				//				return new ModelAndView("forgotPassword","message","incorrect custID/security answer");
				mv.setViewName("forgetPassword");
			mv.addObject("incorrect", "incorrect custID/security answer");
		}else
		{
			//			return new ModelAndView("Login","message","Invalid user ID")
			mv.setViewName("forgetPassword");
			mv.addObject("incorrect", "incorrect custID/security answer");
		}

		return mv;

	}
	@RequestMapping("/change")
	public ModelAndView changePassword(HttpServletRequest request, HttpServletResponse response, @ModelAttribute ForgotPassword f) {



		cdao.forgot(f);
		return new ModelAndView("Login","message","password changed successfully");

	}
}
