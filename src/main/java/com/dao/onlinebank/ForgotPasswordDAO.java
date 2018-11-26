package com.dao.onlinebank;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.model.onlinebank.Customer;
import com.model.onlinebank.ForgotPassword;

public class ForgotPasswordDAO {
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Customer> forgotPassword(ForgotPassword f)
	{
		String qry="Select * from Customer where custID='"+f.getCustID()+"'";
		List l=jdbcTemplate.query(qry, new Object[] {},new BeanPropertyRowMapper<Customer>(Customer.class));
		return l;
	}
	public  int forgot(ForgotPassword f)
	{
		String qry="update Customer set password='"+f.getPassword()+"' where custID ='"+f.getCustID()+"'";
		return jdbcTemplate.update(qry);
	}


}
