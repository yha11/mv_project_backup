package com.runtime.sendbug.service;

public class Computer{
	Computer(){
		
	}
	Computer(int a){
		
	}

	public String ownerName;

	public String getOwnerName() {
		System.out.println(ownerName);
		String ownerName = "박경훈";
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		new Computer();
		this.ownerName = ownerName;
	}
}