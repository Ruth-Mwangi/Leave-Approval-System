package com.jkuates.models;

public class Leave {
	private Integer id;
	private String name;
	private String leaveDescription;
	private Integer days;
	
	
	

	public Leave() {
		
	}
	
	public Leave(String name) {
		
		this.name = name;
	}

	public Leave(Integer id,String name, String leaveDescription, Integer days) {
		
		this.id = id;
		this.name = name;
		this.leaveDescription = leaveDescription;
		this.days = days;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLeaveDescription() {
		return leaveDescription;
	}
	public void setLeaveDescription(String leaveDescription) {
		this.leaveDescription = leaveDescription;
	}
	public Integer getDays() {
		return days;
	}
	public void setDays(Integer days) {
		this.days = days;
	}
	
	
}
