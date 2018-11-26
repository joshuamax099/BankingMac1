package com.controller.onlinebank;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.onlinebank.BeneficiaryDetailsDAO;
import com.model.onlinebank.BenificiaryDetails;
import com.model.onlinebank.Customer;
import com.model.onlinebank.Login;
import com.model.onlinebank.Transaction;


@Controller
public class BenificiaryDetailsController
{



	@Autowired
	BeneficiaryDetailsDAO bdao;

	@RequestMapping(value="/BenificiaryDetails", method=RequestMethod.POST) 
	public ModelAndView addBenificiary(HttpSession session,HttpServletRequest request, HttpServletResponse response,@ModelAttribute BenificiaryDetails bd) throws Exception
	{ 

		ModelAndView mv=new ModelAndView("add_benificiary");
		Customer c=(Customer)session.getAttribute("user");
		String accid=c.getAccount().getAccID();
		System.out.println("bd ifsc"+bd.getIFSC());


		//check ifsc code with branch table
		if(bdao.ifscCheck(bd))
		{

			if(bdao.accnoCheck(bd))
			{
				System.out.println("IFSC CODE VERIFIED");
				//System.out.println("equals");

				BenificiaryDetails b11=bdao.retriveBid(bd.getAccNumber());
				//session.setAttribute("autofill",custid );
				int j=bdao.saveBridge(accid,b11.getbID());
				System.out.println("j ="+j);
				return new ModelAndView("home","message","added");

			}
			else
			{

				int i=bdao.save(bd);
				if(i>0)
				{

					BenificiaryDetails b11=bdao.retriveBid(bd.getAccNumber());
					//session.setAttribute("autofill",custid );
					bdao.saveBridge(accid,b11.getbID());
					return new ModelAndView("home","message","added");
				}
				else
				{
					return new ModelAndView("add_benificiary","message","not inserted");
					//return new ModelAndView("BenificiaryDetails","message","not inserted");
				}
			}


		}


		else
		{
			mv.addObject("message","not valid IFS code");
		}





		return mv;

	}
	@RequestMapping(value="/intrabanking", method=RequestMethod.GET) 
	public ModelAndView intraBanking(HttpSession session,HttpServletRequest request, HttpServletResponse response,@ModelAttribute BenificiaryDetails bd) throws Exception
	{ 
		Customer c=(Customer)session.getAttribute("user");
		String accid=c.getAccount().getAccID();
		ModelAndView mv=new ModelAndView("intraBanking");
		List<Object> list=bdao.retriveBenificiary(accid);
		System.out.println(list);
		mv.addObject("message",list);

		return mv;


	}

	@RequestMapping(value="/displayBenificiary", method=RequestMethod.POST) 
	public ModelAndView displaybenificiarydetails(HttpSession session,HttpServletRequest request, HttpServletResponse response,@ModelAttribute BenificiaryDetails bd) throws Exception
	{ 
		int accid=(Integer)session.getAttribute("user.custID");
		ModelAndView mv=new ModelAndView("displaybenificiarydetails");
		List<Object> list=bdao.displayBenificiary(accid);
		mv.addObject("message",list);
		return mv;


	}

	@RequestMapping(value="/deletebenificiary{bID}", method=RequestMethod.POST) 
	public ModelAndView deleteBenificiary(@PathVariable("bID") long bID,HttpSession session,HttpServletRequest request, HttpServletResponse response,@ModelAttribute BenificiaryDetails bd) throws Exception
	{ 
		ModelAndView mv=new ModelAndView("BenificiaryDetails");
		int i=bdao.deleteBenificiary(bID);

		return mv;


	}



	@RequestMapping(value="/selectedbenificiary{bID}") 
	public ModelAndView viewBenificiary(@PathVariable("bID") long bID,HttpSession session,HttpServletRequest request, HttpServletResponse response,@ModelAttribute BenificiaryDetails bd) throws Exception
	{

		ModelAndView mv=new ModelAndView("confirmBenificiaryIntra");
		session.setAttribute("bid", bID);
		List<Object> list=bdao.confirmBenificiary(bID);
		mv.addObject("message",list);
		return mv;


	}

	@RequestMapping(value="/addAmount1") 
	public ModelAndView addAccount(HttpSession session,HttpServletRequest request, HttpServletResponse response,@ModelAttribute BenificiaryDetails bd) throws Exception
	{

		ModelAndView mv=new ModelAndView("Transaction");
		List<BenificiaryDetails> lst= (List<BenificiaryDetails>)session.getAttribute("message");
		//	System.out.println("We are here hello");
		//System.out.println(lst.get(0).getbID());
		//System.out.println(lst.get(0).getIFSC());
		//System.out.println("We went from here");
		mv.addObject("accno",lst.get(0).getAccNumber());
		mv.addObject("ifsc",lst.get(0).getIFSC());
		mv.addObject("bid",lst.get(0).getbID());
		return mv;


	}


	//@RequestMapping(value="/selectedbenificiary{accNumber}", method=RequestMethod.POST)
	@RequestMapping(value="/addAmount", method=RequestMethod.POST)
	public ModelAndView transaction(HttpSession session,HttpServletRequest request, HttpServletResponse response,@ModelAttribute Transaction tr,BenificiaryDetails bd) throws Exception
	{
		//BenificiaryDetails bid=(BenificiaryDetails)session.getAttribute("bid");
		//System.out.println(bid.getAccNumber());
		//List<Account> list=bdao.retriveAmount(accid);

		//double amt=Double.parseDouble((String) list.get(0));
		ModelAndView mv=new ModelAndView("dummy");
		//if(bdao.check(bd))
		//	{
		System.out.println("tr.getamount:"+tr.getAmount());

		//			double b=Double.parseDouble(request.getParameter(arg0))

		//	System.out.println("amt ="+amt);
		//double samt=400000;
		//double ramt=10000;
		//double senderBalance=amt-tr.getAmount();
		///System.out.println("amount ="+tr.getAmount());
		//System.out.println(senderBalance);
		//double recieverBalance=ramt+tr.getAmount();
		//	if(senderBalance<=1000)
		{
			//		System.out.println("helllll");
			//		return new ModelAndView("BenificiaryDetails","message","+-6");

			//	}
			//	else
			//	{
			String str=request.getParameter("accNumber");
			System.out.println("accno:"+str);
			//List<BenificiaryDetails> list=bdao.retriveBenificiary(accid);
			//	List<BenificiaryDetails> lst= (List<BenificiaryDetails>)session.getAttribute("message");
			//		BenificiaryDetails b=lst.get(0);
			//System.out.println("lst.get(0)"+b);



			//int i=bdao.updateSender(tr.getAmount(),accid);
			int i=bdao.updateSender(1000,2100);
			if(i>0)				
			{

				int j=bdao.updateReceiver(1000,4081);

				//int k=bdao.saveTransaction(accid, tr.getAmount(), bd.getIFSC(),tr.getbID(), tr.getPurpose());
				mv.addObject("message","Transaction successfull");
			}

		}
		//	}
		//	else
		//	{
		//		return new ModelAndView("BenificiaryDetails","message","Transaction not successfull check ifsc code");
		//	}


		return mv;


	}



}


