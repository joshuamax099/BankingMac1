package com.model.onlinebank;

public class Address {

	private int adID;
	private int custID;
	private String plotNo;
	private String street;
	private String city;
	private String postalCode;
	private String country;
	private String state;


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public Address() {

	}


	public int getAdID() {
		return adID;
	}


	public void setAdID(int adID) {
		this.adID = adID;
	}


	public int getCustID() {
		return custID;
	}


	public void setCustID(int custID) {
		this.custID = custID;
	}


	public String getPlotNo() {
		return plotNo;
	}


	public void setPlotNo(String plotNo) {
		this.plotNo = plotNo;
	}


	public String getStreet() {
		return street;
	}


	public void setStreet(String street) {
		this.street = street;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getPostalCode() {
		return postalCode;
	}


	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}




}
