package com.controller.onlinebank;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.onlinebank.AdminDAO;
import com.dao.onlinebank.LoginDAO;
import com.dao.onlinebank.TransactionDAO;
import com.model.onlinebank.Account;
import com.model.onlinebank.Customer;
//import com.model.onlinebank.ForgotPassword;
import com.model.onlinebank.Login;
@Controller
public class LoginController
{
	@Autowired
	LoginDAO ldao;

	@Autowired
	AdminDAO adao;


	@Autowired
	TransactionDAO tdao;

	/**
	 * Its used to I 
	 */
	@RequestMapping(value="/Login", method=RequestMethod.POST) 
	public ModelAndView login(HttpSession session,HttpServletRequest request, HttpServletResponse response,@ModelAttribute Login log) throws Exception
	{ 

		List<Login> list=ldao.validateLogin(log);
		ModelAndView mv=new ModelAndView(); 

		int flag=0;
		String x=null;
		for (Login l : list) {


			if(log.getCustID().equals(l.getCustID().trim())){

				if(log.getPassword().equals(l.getPassword().trim())){

					flag=1;
					x=l.getCustID();
					break;
				}
			}
		}
		if(flag==1)
		{
			if(ldao.status(x)==1)
			{
				//New session creation
				session=request.getSession(true);
				//setting attribute on session
				Customer c=adao.getSingleCustomer(log.getCustID());
				List lst=tdao.getAccount(c.getCustID());
				Account a=(Account) lst.get(0);
				c.setAccount(a);
				session.setAttribute("user",c);
				session.setAttribute("loginStatus", "Customer");
				//send request to Welcome.jsp page
				System.out.println("new session");

				mv.setViewName("home");; 
			}

			else if(ldao.status(x)==2)
			{
				//New session creation
				session=request.getSession(true);
				//setting attribute on session
				Customer c=adao.getSingleCustomer(log.getCustID());
				List lst=tdao.getAccount(c.getCustID());
				Account a=(Account) lst.get(0);
				c.setAccount(a);
				session.setAttribute("user",c);
				session.setAttribute("loginStatus", "Admin");
				//send request to Welcome.jsp page
				System.out.println("new session");
				mv.setViewName("admin");
			}	
			return mv;
		}
		else
		{
			mv.setViewName("Login");
			mv.addObject("message", "Invalid user name or password");
		}
		return mv;
	}
}


