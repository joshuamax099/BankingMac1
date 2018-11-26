package com.dao.onlinebank;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.model.onlinebank.BenificiaryDetails;

import com.model.onlinebank.Login;



public class BenificiaryDetailsDAO 
{
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int save(BenificiaryDetails bd)
	{
		String query = "insert into BeneficiaryDetails values" +"(benificiaryID.nextval ,'"+bd.getName()+"' , '"+bd.getAccNumber()+"' , '"+bd.getIFSC()+"' )";
		return jdbcTemplate.update(query);


	}

	public int saveBridge(long accid,long bid)
	{
		String query = "insert into bridge values" +"('"+accid+"' , '"+bid+"' )";
		return jdbcTemplate.update(query);




	}



	public BenificiaryDetails retriveBid(long Accno)
	{
		String query="select bid from BeneficiaryDetails where ACCNUMBER="+Accno;
		@SuppressWarnings("unchecked")
		List<BenificiaryDetails> bidList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(BenificiaryDetails.class));
		BenificiaryDetails b=bidList.get(0);
		return b;

	}
	public boolean ifscCheck(BenificiaryDetails b) {

		boolean flag=false;
		String query="select ifsc from branch " ;

		@SuppressWarnings("unchecked")
		List<BenificiaryDetails> ifscList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(BenificiaryDetails.class));
		for(BenificiaryDetails bd:ifscList)
		{
			if(bd.getIFSC().equals(b.getIFSC()))
			{
				flag=true;
				break;
			}
		}
		return flag;

	}
	public boolean accnoCheck(BenificiaryDetails b) {

		boolean flag=false;
		String query="select accNumber from BeneficiaryDetails" ;

		@SuppressWarnings("unchecked")
		List<BenificiaryDetails> accnocList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(BenificiaryDetails.class));
		for(BenificiaryDetails bd:accnocList)
		{
			if(bd.getAccNumber()==b.getAccNumber())
			{
				flag=true;
				break;
			}
		}


		return flag;

	}
	public List<Object> retriveBenificiary(long accid)
	{


		String query="select * from  BeneficiaryDetails where bid IN(select bid from bridge where accid="+accid+")and ifsc LIKE 'AAB%'" ;

		@SuppressWarnings("unchecked")
		List<Object> accnocList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(BenificiaryDetails.class));



		return accnocList;


	}

	public List<Object> displayBenificiary(long accid)
	{


		String query="select * from  BeneficiaryDetails where bid IN(select bid from bridge where accid="+accid+")" ;

		@SuppressWarnings("unchecked")
		List<Object> displayBencList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(BenificiaryDetails.class));



		return displayBencList;


	}


	public List<Object> confirmBenificiary(long bID)
	{


		String query="select * from  BeneficiaryDetails where bid="+bID ;

		@SuppressWarnings("unchecked")
		List<Object> bidList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(BenificiaryDetails.class));



		return bidList;


	} 
	public double retriveAmt(long accId)
	{
		String query="select amount from account where accId="+accId;
		List l=jdbcTemplate.queryForList(query);
		double amt=(double) l.get(0);
		return amt;
	}


	public int update(double amt,long accId,long accNumber)
	{

		String query="update account set amount=amount-' "+amt+" ' where accId = ' "+accId+" ' ";
		query="update account set amount=amount+' "+amt+" ' where accNumber = ' "+accNumber+" ' ";
		jdbcTemplate.update(query);

		return jdbcTemplate.update(query);

	}

	public boolean check(BenificiaryDetails b)
	{
		boolean flag=false;
		String query="select IFSC from account where ACCNUMBER="+b.getAccNumber();

		@SuppressWarnings("unchecked")
		List<BenificiaryDetails> accnocList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(BenificiaryDetails.class));
		for(BenificiaryDetails bd:accnocList)
		{

			if(bd.getIFSC().equals(b.getIFSC()))
			{
				flag=true;

			}

		}


		return flag;


	}

	public int  deleteBenificiary(long bid)
	{
		String query="delete from bridge where bid="+bid;

		jdbcTemplate.update(query);

		return jdbcTemplate.update(query);
	}

}