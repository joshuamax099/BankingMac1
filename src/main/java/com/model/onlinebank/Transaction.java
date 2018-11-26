package com.model.onlinebank;

public class Transaction 
{
	private int tID;
	private long accID;
	private String TransType;
	private double amount;
	private String ifsc;
	private int bID; 
	private String purpose;
	public Transaction() {
		super();
	}
	public int gettID() {
		return tID;
	}
	public void settID(int tID) {
		this.tID = tID;
	}
	public long getAccID() {
		return accID;
	}
	public void setAccID(long accID) {
		this.accID = accID;
	}
	public String getTransType() {
		return TransType;
	}
	public void setTransType(String transType) {
		TransType = transType;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getIfsc() {
		return ifsc;
	}
	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}
	public int getbID() {
		return bID;
	}
	public void setbID(int bID) {
		this.bID = bID;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	} 

}
