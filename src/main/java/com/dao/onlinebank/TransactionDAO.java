package com.dao.onlinebank;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.model.onlinebank.Account;
import com.model.onlinebank.BenificiaryDetails;
import com.model.onlinebank.Customer;
import com.model.onlinebank.MiscellaneousDetails;
import com.model.onlinebank.Transaction;

public class TransactionDAO {
	private String qry;
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Account> getAccount(String custID)
	{
		qry="Select * from Account where custID ='"+custID+"'";
		List<Account> lst=jdbcTemplate.query(qry,new BeanPropertyRowMapper(Account.class));
		return lst;
	}

	public List<BenificiaryDetails> getBeneficaryId(String custID)
	{

		//		qry="Select accid from Account where custID IN("+accid+")";
		//		List<Account> lst=jdbcTemplate.query(qry,new BeanPropertyRowMapper(Account.class));

		qry="select * from  BeneficiaryDetails where bid IN(select bid from bridge where accid IN(select accid from account where custid='"+custID+"')) and ifsc not like 'AAB%'";
		List<BenificiaryDetails> lst1=jdbcTemplate.query(qry,new BeanPropertyRowMapper(BenificiaryDetails.class));
		return lst1;
	}

	public List<BenificiaryDetails>  getSingleBenificary(long bid){
		qry="select * from  BeneficiaryDetails where bid ="+bid;
		List<BenificiaryDetails> lst2=jdbcTemplate.query(qry,new BeanPropertyRowMapper(BenificiaryDetails.class));
		return lst2;
	}

	public  int updateAmount(double amount,Account a)
	{
		qry="update account set amount=amount-"+amount+" where accID="+a.getAccID();
		System.out.println(qry);
		return jdbcTemplate.update(qry);
	}

	public List<Transaction> getLasttransaction(String accID) {
		String qry="select *from transaction where accid='"+accID+"'";
		List<Transaction> lst2=jdbcTemplate.query(qry,new BeanPropertyRowMapper(Transaction.class));
		return lst2;
	}


}
