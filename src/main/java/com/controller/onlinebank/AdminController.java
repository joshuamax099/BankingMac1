package com.controller.onlinebank;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.onlinebank.AdminDAO;
import com.dao.onlinebank.LoginDAO;
import com.model.onlinebank.Account;
import com.model.onlinebank.Customer;
import com.model.onlinebank.Login;
import com.model.onlinebank.Status;


@Controller
public class AdminController 
{
	@Autowired
	public AdminDAO adao;

	@Autowired
	LoginDAO ldao;

	@RequestMapping("/viewapplicants")
	public ModelAndView  viewApplicants(HttpServletRequest request,HttpServletResponse response,HttpSession session)
	{
		ModelAndView mv=new ModelAndView("viewApplicantList");
		List<Customer> lst=adao.getapplicants();
		session.setAttribute("adminlist",lst);
		mv.addObject("status", "Applicant");
		return mv;
	}

	@RequestMapping("/singleapplicant{custID}")
	public ModelAndView  viewSingleApplicants(@PathVariable("custID") String custID, HttpServletRequest request,HttpServletResponse response,HttpSession session)
	{
		System.out.println(custID);
		Customer c=adao.getSingleCustomer(custID);
		System.out.println(c.getFirstName());
		System.out.println(c.getAdd().getCountry());
		System.out.println(c.getMisc().getEmployment());

		ModelAndView mv=new ModelAndView("singleapplicant");
		List<Customer> lst=adao.getapplicants();
		session.setAttribute("applicant",c);
		return mv;
	}


	@RequestMapping("/approvalstatusApprovel")
	public ModelAndView  approvalStatusApproved( HttpServletRequest request,HttpServletResponse response,HttpSession session)
	{
		Customer c=(Customer) session.getAttribute("applicant");
		adao.setApproval(c.getCustID());
		adao.kit(c);
		session.removeAttribute("adminlist");
		List<Customer> lst=adao.getapplicants();
		session.setAttribute("adminlist",lst);
		ModelAndView mv=new ModelAndView("viewApplicantList");

		return mv;
	}

	@RequestMapping("/approvalstatusReject")
	public ModelAndView  approvalStatusRejected( HttpServletRequest request,HttpServletResponse response,HttpSession session)
	{


		Customer c=(Customer) session.getAttribute("applicant");
		adao.setReject(c.getCustID());
		List<Customer> lst=adao.getapplicants();
		session.setAttribute("adminlist",lst);
		ModelAndView mv=new ModelAndView("viewApplicantList");

		return mv;
	}
	@RequestMapping("/viewcustomers")
	public ModelAndView  viewCustomer(HttpServletRequest request,HttpServletResponse response,HttpSession session)
	{
		ModelAndView mv=new ModelAndView("viewApplicantList");
		List<Customer> lst=adao.getCustomer();
		session.setAttribute("adminlist",lst);
		mv.addObject("status", "Customer");
		return mv;
	}

	@RequestMapping("/deletecustomers")
	public ModelAndView  customerDelete(HttpServletRequest request,HttpServletResponse response,HttpSession session)
	{
		Customer c=(Customer) session.getAttribute("applicant");
		System.out.println(c.getCustID());
		int n=adao.customerDelete(c.getCustID());
		session.removeAttribute("adminlist");
		List<Customer> lst=adao.getCustomer();
		session.setAttribute("adminlist",lst);
		ModelAndView mv=new ModelAndView("viewApplicantList");
		return mv;
	}

	@RequestMapping("/statusCheck")
	public ModelAndView  checkStatus(HttpServletRequest request,HttpServletResponse response,HttpSession session,@ModelAttribute Status s)
	{

		Login l= new Login();
		l.setCustID(s.getCustID());
		l.setPassword(s.getPassword());
		List<Login> list=ldao.validateLogin(l);
		ModelAndView mv=new ModelAndView();
		int flag=0;
		String x=null;
		for (Login l1 : list) {


			if(l.getCustID().equals(l1.getCustID().trim())){

				if(l.getPassword().equals(l1.getPassword().trim())){

					flag=1;
					x=l.getCustID();
					break;
				}
			}
		}


		if(flag==1)
		{
			int n=adao.generateKit(s);
			//based on status retrieve the account details

			if(n==1) {
				List<Account> accLst=adao.getAccountDetails(s.getCustID());
				Account account =(Account)accLst.get(0);
				mv.addObject("acc",account);
				mv.setViewName("viewStatus");
				return mv;
			}
			else if(n==2) {
				mv.addObject("message","onhold");
				mv.setViewName("viewStatus");
				return mv;
			}
			else if(n==0) {
				mv.setViewName("viewStatus");
				mv.addObject("message","rejected");
				return mv;
			}

			return mv;
		}
		else
		{
			mv.setViewName("statusCheck");
			mv.addObject("message","Username or Password Incorrect");
			return mv;
		}
	}


}


