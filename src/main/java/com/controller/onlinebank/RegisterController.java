package com.controller.onlinebank;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.onlinebank.AdminDAO;
import com.dao.onlinebank.RegisterDAO;
import com.model.onlinebank.Address;
import com.model.onlinebank.Customer;
import com.model.onlinebank.MiscellaneousDetails;

@Controller
public class RegisterController {


	@Autowired
	public RegisterDAO rdao;

	@Autowired
	AdminDAO adao;
	/*Registeration of the user*/
	@RequestMapping("/register")
	public ModelAndView register(HttpServletRequest request,HttpServletResponse response,@ModelAttribute Customer c,Address a,MiscellaneousDetails m)
	{
		c.setStatus("Applicant");
		c.setApprovalStatus("onhold");

		rdao.save(c, a, m);
		Customer c1=rdao.getCustomer(c);
		c1.setAdd(adao.getCustomerAddress(c1.getCustID()));
		c1.setMisc(adao.getCustomerMisc(c1.getCustID()));
		ModelAndView mv=new ModelAndView("Success");
		mv.addObject("reguser", c1);
		return mv;
	}
}
