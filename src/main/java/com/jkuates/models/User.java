package com.jkuates.models;

public class User {
	private String fname;
	private String lname;
	private String title;
	
	
	public User(String fname, String lname, String title) {
		this.fname = fname;
		this.lname = lname;
		this.title = title;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	} 
	
	

}
