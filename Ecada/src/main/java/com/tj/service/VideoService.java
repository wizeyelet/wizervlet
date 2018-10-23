package com.tj.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface VideoService {

	public ArrayList<HashMap<String, Object>> list(HashMap<String, String> params);
}
