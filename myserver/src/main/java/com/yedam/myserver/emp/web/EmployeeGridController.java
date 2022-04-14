package com.yedam.myserver.emp.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.myserver.emp.mapper.EmployeeMapper;

@RestController
public class EmployeeGridController {

	@Autowired EmployeeMapper mapper;
	//조회
	@GetMapping("/readEmp")
	public Map<String, Object> readEmp(){
		Map<String, Object> pagination = new HashMap<String, Object>();
		pagination.put("page", 1);
		pagination.put("totalCount", 100);  //나중에 전체 건수 구하는 쿼리 구하고 바꿔주기.
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("contents", mapper.findEmployees() );
		data.put("pagination", pagination );
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", data);
		
		return map;
	}
	
	/*{
		  "result": true,
		  "data": {
		    "contents": [],
		    "pagination": {
		      "page": 1,
		      "totalCount": 100
		    }
		  }
		}*/
}
