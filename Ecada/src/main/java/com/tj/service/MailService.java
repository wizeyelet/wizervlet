package com.tj.service;

import java.util.HashMap;

public interface MailService {

	void compareEmail(String email, String userId);

	void resetPw(HashMap<String, String> params);

}
