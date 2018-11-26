package com.dao.onlinebank;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;

//import com.model.onlinebank.ForgotPassword;
import com.model.onlinebank.Login;

public class LoginDAO 
{
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}



	public List<Login> validateLogin(Login ln) {


		String query="select custID ,password from Customer";

		@SuppressWarnings("unchecked")
		List<Login> loginList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(Login.class));

		return loginList;

	}

	/*	public List<ForgotPassword> emailVerify() {


		String query="select custID ,emailID from Customer";

		@SuppressWarnings("unchecked")
		List<ForgotPassword> loginList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(ForgotPassword.class));



		return loginList;

	}*/
	public int status(String custID)
	{

		String query="select status from customer where custID ="+custID;
		List<Login> statusList  = getJdbcTemplate().query(query,new BeanPropertyRowMapper(Login.class));
		Login l=statusList.get(0);
		System.out.println(l.getStatus());
		if(l.getStatus().equals("Customer"))
		{
			return 1;

		}
		else if(l.getStatus().equals("Admin"))
		{
			return 2;
		}
		else
		{
			return 0;
		}

	}




}
