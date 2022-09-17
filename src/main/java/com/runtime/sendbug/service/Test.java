package com.runtime.sendbug.service;

import com.runtime.sendbug.service.impl.TestServiceImpl2;

public class Test {

	public static void main(String[] args) {
		TestService ts = new TestServiceImpl2();
		ts.getTests();
	}
}
