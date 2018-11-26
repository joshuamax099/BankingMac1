package com.dao.onlinebank;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.model.onlinebank.Account;
import com.model.onlinebank.Address;
import com.model.onlinebank.Customer;
import com.model.onlinebank.Login;
import com.model.onlinebank.MiscellaneousDetails;
import com.model.onlinebank.Status;


public class AdminDAO 
{

	private JdbcTemplate jdbcTemplate;
	private List<Customer> loginList;  

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	public List<Customer> getapplicants() {
		String query="select * from Customer where status='Applicant'";
		return retrieveCustomerOrApplicant(query);
	}

	public List<Customer> getCustomer() {
		String query="select * from Customer where status='Customer'";
		return retrieveCustomerOrApplicant(query);
	}

	public List<Customer> retrieveCustomerOrApplicant(String query)
	{
		loginList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(Customer.class));

		for (Customer customer : loginList)
		{
			Address a=getCustomerAddress(customer.getCustID());
			MiscellaneousDetails m=getCustomerMisc(customer.getCustID());
			customer.setAdd(a);
			customer.setMisc(m);
		}
		return loginList;
	}







	public Customer getSingleCustomer(String string)
	{
		String qry="Select * from customer where custID=?";
		Customer c1=jdbcTemplate.queryForObject(qry,new Object[]{string},
				new BeanPropertyRowMapper<Customer>(Customer.class));
		c1.setAdd(getCustomerAddress(c1.getCustID()));
		c1.setMisc(getCustomerMisc(c1.getCustID()));

		return c1;
	}

	public Address getCustomerAddress(String string)
	{
		String qry="Select * from Address where custID=?";
		return jdbcTemplate.queryForObject(qry,new Object[]{string},
				new BeanPropertyRowMapper<Address>(Address.class));
	}
	public MiscellaneousDetails getCustomerMisc(String string)
	{
		String qry="Select * from MiscellaneousDetails where custID=?";
		return jdbcTemplate.queryForObject(qry,new Object[]{string},
				new BeanPropertyRowMapper<MiscellaneousDetails>(MiscellaneousDetails.class));
	}

	public int setApproval(String string)
	{
		String qry="update customer set status='Customer',approvalStatus='approved' where custID='"+string+"'";
		return jdbcTemplate.update(qry);
	}
	public int setReject(String string)
	{
		String qry="update customer set approvalStatus='rejected' where custID='"+string+"'";
		return jdbcTemplate.update(qry);
	}
	public int customerDelete(String string)
	{
		String qry="delete from customer where custID='"+string+"'";
		return jdbcTemplate.update(qry);
	}

	public int kit(Customer c1)
	{

		//insert into account values(accid.nextval,'11485091','aisha',accountNumber.nextval,'savings','AAB106',50000,tPassword.nextval);'"+"AAB106"+"'
		String query = "insert into Account values" +"(accid.nextval,'"+c1.getCustID()+"' ,'"+c1.getFirstName()+"',accountNumber.nextval, "
				+ "'"+c1.getMisc().getAccountType()+"','"+"AAB106"+"','"+c1.getMisc().getBalance()+"',transPassword.nextval )";
		return jdbcTemplate.update(query);

	}

	public int generateKit(Status l)
	{
		String query="select APPROVALSTATUS from customer where custID ="+l.getCustID();
		List<Status> statusList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(Status.class));
		System.out.println(statusList.get(0).getApprovalstatus());
		Status s=statusList.get(0);

		if(s.getApprovalstatus().equals("approved"))
		{
			return 1;

		}
		else if(s.getApprovalstatus().equals("onhold"))
		{
			return 2;
		}
		else if(s.getApprovalstatus().equals("rejected"))
		{
			return 0;
		}
		return 0;
	}

	public List<Account> getAccountDetails(String custID) {
		String query="Select *from account where custid="+custID;
		List<Account> accList=getJdbcTemplate().query(query,new BeanPropertyRowMapper(Account.class));
		return accList;
	}



}
