package com.controller.onlinebank;

import java.util.ArrayList;
import java.util.Calendar;
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
import com.dao.onlinebank.BeneficiaryDetailsDAO;
import com.dao.onlinebank.TransactionDAO;
import com.model.onlinebank.Account;
import com.model.onlinebank.BenificiaryDetails;
import com.model.onlinebank.Customer;
import com.model.onlinebank.Transaction;

@Controller
public class TransactionController {
	List lst;
	@Autowired
	public TransactionDAO tdao;

	@Autowired
	public BeneficiaryDetailsDAO bdao;

	@RequestMapping("/intertransfertype")
	public ModelAndView transferpages(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv= new ModelAndView("intertransfertype");
		return mv;
	}

	@RequestMapping("/modeoftransfer")
	public ModelAndView getCustomersDetails(HttpServletRequest request,HttpServletResponse response,HttpSession session)
	{

		Customer c=(Customer)session.getAttribute("user");


		ModelAndView mv=new ModelAndView();
		List<Account> alst=tdao.getAccount(c.getCustID());

		for (Account account : alst) {
			System.out.println(" asd" +account);
			System.out.println(account );
			System.out.println(account );
		}


		session.setAttribute("accountlist",alst);

		List<BenificiaryDetails> lst=tdao.getBeneficaryId(c.getCustID());
		System.out.println(lst);
		System.out.println("bid"+lst);
		session.setAttribute("beneficarylist", lst);

		if(request.getParameter("transactiontype").equals("NEFT"))
		{
			mv.setViewName("interBankingBene");
		}
		else
		{
			mv.setViewName("RTGS");	
		}


		return mv;
	}

	@RequestMapping("/choosebenificiary{bID}")
	public ModelAndView choosebeneficiary(@PathVariable("bID") long bID, HttpServletRequest request,HttpServletResponse response,HttpSession session)
	{
		ModelAndView mv= new ModelAndView("interamount");
		List<BenificiaryDetails> b=tdao.getSingleBenificary(bID); 

		List<Account> lst=(List<Account>) session.getAttribute("accountlist");
		Account a=lst.get(0);
		System.out.println(a.getTransPassword());
		session.setAttribute("remitter",a);
		session.setAttribute("beneficiary",b.get(0));
		return mv;
	}

	@RequestMapping("/confirm")
	public ModelAndView confirm(HttpServletRequest request,HttpServletResponse response,HttpSession session)
	{
		Account a1=(Account) session.getAttribute("remitter");
		ModelAndView mv= new ModelAndView();

		if(request.getParameter("transpass").equals(a1.getTransPassword()))
		{
			Calendar currTime = Calendar.getInstance();
			int hour = currTime.get(Calendar.HOUR_OF_DAY);

			if (hour >=8 && hour < 19) 
			{
				int a=Integer.parseInt(request.getParameter("amount"));
				int charges=0;
				double gst=0,total=0;
				lst=new ArrayList();

				if((a1.getAmount()-a)>10000)
				{System.out.println(a1.getAmount()-a);
				if(a<10000)
				{
					charges=1;
				}
				else if(a>=10000 && a<100000)
				{
					charges=2;
				}
				else if(a>=100000 && a<200000)
				{
					charges=3;
				}
				else if(a>=200000 && a<1000000)
				{
					charges=5;
				}
				gst=0.18*a;
				total=a+charges+gst;

				lst.add(a);
				lst.add(charges);
				lst.add(gst);
				lst.add(total);
				lst.add(a1);
				session.setAttribute("neftdata", lst);
				mv.setViewName("intertransferverify");
				}	
				else
				{	
					mv.setViewName("interamount");
					mv.addObject("neftstatus", "invalid amount to maintain minimum balance");
				}

			}
			else
			{
				mv.setViewName("interamount");
				mv.addObject("neftstatus", "Neft services are only available from 8.00 AM to 6.00 PM");
			}
		}
		else {
			mv.setViewName("interamount");
			mv.addObject("transpassstatus", "Transsaction password incorrect");

		}

		return mv;
	}


	@RequestMapping("/confirmtransfer")
	public ModelAndView viewconfirmapp(HttpServletRequest request,HttpServletResponse response,HttpSession session)
	{
		ModelAndView mv=new ModelAndView("finalNeft");
		lst=(List) session.getAttribute("neftdata");
		double a=(double) lst.get(3);
		Account a1=(Account) lst.get(4);
		tdao.updateAmount(a,a1);

		return mv;


	}
	@RequestMapping("/lastTrans")
	public ModelAndView lastTrans(HttpServletRequest request,HttpServletResponse response,HttpSession session )
	{
		Customer c=(Customer)session.getAttribute("user");
		System.out.println(c.getAccount().getAccID());
		ModelAndView mv=new ModelAndView("home");
		List<Transaction> lst=tdao.getLasttransaction(c.getAccount().getAccID());
		System.out.println(lst);
		if(lst.size()>0) {
			mv.addObject("lst",lst);
			return mv;
		}
		else {
			mv.addObject("message","No Transactions yet");
			return mv;
		}


	}

}
