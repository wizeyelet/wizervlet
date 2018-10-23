package com.tj.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface GridService {

	ArrayList<HashMap<String, Object>> gList(HashMap<String, String> params);

	int getTotalCount(HashMap<String, String> params);

}
