package com.jkuates.models;

public class Approver extends User {
	private Integer id;
	
	
	
	public Approver() {
		super();
		// TODO Auto-generated constructor stub
	}





	public Approver(String fname, String lname, String title, Integer id) {
		super(fname, lname, title);
		this.id = id;
	}
	
	
	


	public Approver(String fname, String lname,Integer id) {
		super(fname, lname);
		this.id = id;
	}





	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}
