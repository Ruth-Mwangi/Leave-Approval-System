package com.jkuates.models;

public class Approver extends User {
	private Integer id;
	
	public Approver(String fname, String lname, String title, Integer id) {
		super(fname, lname, title);
		this.id = id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}
