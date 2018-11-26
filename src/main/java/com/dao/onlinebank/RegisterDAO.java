package com.dao.onlinebank;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.model.onlinebank.Address;
import com.model.onlinebank.Customer;
import com.model.onlinebank.MiscellaneousDetails;

public class RegisterDAO {
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/*insertion of data of customer,address and miscellaneous in database*/
	public int save(Customer c,Address a,MiscellaneousDetails m)
	{
		String query = "insert into customer values" +"(CustomerID.nextval , '"+c.getFirstName()+"' , '"+c.getLastName()+"' , '"+c.getMiddleName()+"' , '"+c.getGender()+"' , to_date('"+c.getDateOfBirth()+"','yyyy-mm-dd'),'"+c.getPlaceOfBirth()+"','"+c.getNationality()+"','"+c.getCitizenship()+"','"+c.getMartialStatus()+"','"+c.getAdharCardNumber()+"','"+c.getPassword()+"','"+c.getPanNumber()+"','"+c.getPhoneNumber()+"','"+c.getEmailID()+"','"+c.getStatus()+"','"+c.getSalutation()+"','"+c.getApprovalStatus()+"','"+c.getAns1()+"')";
		jdbcTemplate.update(query);

		Customer cid=getCustomer(c);
		System.out.println(cid.getCustID());

		query = "insert into address values" +"(AddressID.nextval , '"+cid.getCustID()+"' , '"+a.getPlotNo()+"' , '"+a.getStreet()+"' , '"+a.getCity()+"' , '"+a.getPostalCode()+"','"+a.getCountry()+"','"+a.getState()+"')";
		jdbcTemplate.update(query);

		query= "insert into MiscellaneousDetails values" +"(MiscID.nextval,'"+cid.getCustID()+"','"+m.getReligion()+"','"+m.getCategory()+"','"+m.getEmployment()+"','"+m.getOccupation()+"','"+m.getAnnualIncome()+"','"+m.getAccountType()+"','"+m.getBalance()+"')";
		return jdbcTemplate.update(query);
	}
	/*retriveing the cutsomer of registered for obtaining the customer id*/
	public Customer getCustomer(Customer c)
	{
		String qry="Select * from customer where phoneNumber=?";
		return jdbcTemplate.queryForObject(qry,new Object[]{c.getPhoneNumber()},
				new BeanPropertyRowMapper<Customer>(Customer.class));
	}

}

