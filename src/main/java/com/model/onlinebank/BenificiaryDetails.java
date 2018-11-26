package com.model.onlinebank;

public class BenificiaryDetails
{
	
	//bID number(10) primary key,
	private long bID;
	private String name ;
	private long accNumber;
	private String IFSC ;
	private long accId;
	
	public long getAccId() {
		return accId;
	}
	public void setAccId(long accId) {
		this.accId = accId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getAccNumber() {
		return accNumber;
	}
	public void setAccNumber(long accNumber) {
		this.accNumber = accNumber;
	}
	public String getIFSC() {
		return IFSC;
	}
	public void setIFSC(String iFSC) {
		IFSC = iFSC;
	}
	public BenificiaryDetails() {
		super();
	}
	public long getbID() {
		return bID;
	}
	public void setbID(long bID) {
		this.bID = bID;
	}
	
	

}