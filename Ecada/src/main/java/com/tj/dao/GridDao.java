package com.tj.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface GridDao {

	ArrayList<HashMap<String, Object>> gList(HashMap<String, String> params);

	int getTotalCount(HashMap<String, String> params);

}
