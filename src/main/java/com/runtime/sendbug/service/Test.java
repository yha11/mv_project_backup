package com.runtime.sendbug.service;

import java.lang.reflect.Method;

public class Test {

	class Test2{
		
	}
	public static void print(String... str) {
		System.out.println(str);
	}
	public static void main(String[] args) {
		print(); 
		print("1");
		print("1","2");
		
		Method method;
	}
}
