package com.model.onlinebank;
 
public class ForgotPassword {
	private String custID;
	private String password;
	private String answer;
	
	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}

 
	
	 
	public ForgotPassword() {
		super();
	}


	public String getCustID() {
		return custID;
	}
	public void setCustID(String custID) {
		this.custID = custID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
