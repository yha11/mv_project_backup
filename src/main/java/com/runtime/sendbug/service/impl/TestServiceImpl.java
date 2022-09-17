package com.runtime.sendbug.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.runtime.sendbug.service.TestService;

public class TestServiceImpl implements TestService {

	@Override
	public List<String> getTests() {
		return new ArrayList<>();
	}

}
