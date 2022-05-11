package com.yedam.myserver;

import java.io.File;
import java.net.URL;
import java.util.List;

import org.junit.Test;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.myserver.emp.vo.Departments;
import com.yedam.myserver.emp.vo.Employee;



public class ObjectMapperTest {

	//@Test
	public void toJson() throws Exception {
		Departments dept = new Departments();
		dept.setDepartment_id("60");
		dept.setDepartment_name("인사");
		new ObjectMapper().writeValue(new File("dept.json"), dept);
		
		String str = new ObjectMapper().writeValueAsString(dept);
		System.out.println(str);
		
		
	}
	
	//@Test
	public void toObject() throws Exception {
		String str = "{\"location_id\":null,\"city\":null,\"manager_id\":null,\"manager_name\":null,\"department_name\":\"개발\",\"department_id\":\"60\"}";
		//Departments dept = new ObjectMapper().readValue(str, Departments.class );
		Departments dept = new ObjectMapper().readValue(new File("dept.json"), Departments.class );
		System.out.println(dept.getDepartment_name());
	}
	
	///@Test
	public void URLtoObject() throws Exception{
		String url = "http://localhost/myserver/empSelect";
		//첫 번째 사원의 이름만 출력, 리스트 또는 array.
		
		
		  Employee[] emps = new ObjectMapper().readValue(new URL(url),Employee[].class);
		  System.out.println(emps[0].getFirst_name());
		 
		 
		
		List<Employee> emp = new ObjectMapper().readValue(new URL(url), new TypeReference<List<Employee>>() {}); 
		System.out.println(emp.get(0).getFirst_name());
	}

				
}


