package com.tj.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface VideoDao {

	public ArrayList<HashMap<String, Object>> list(HashMap<String, String> params);
}
