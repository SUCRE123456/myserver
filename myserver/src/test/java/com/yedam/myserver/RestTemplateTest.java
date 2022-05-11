package com.yedam.myserver;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.yedam.myserver.emp.vo.Employee;

public class RestTemplateTest {
	
	//@Test
	public void exchangeText() {
		String url = "http://localhost/myserver/empInsertjson";
		/* Employee param = new Employee();
		param.setEmployee_id(4000);
		param.setLast_name("테스트");
		param.setFirst_name("홍");
		param.setEmail("a@a.z");
		param.setHire_date(new Date());
		param.setJob_id("IT_PROG");
		 */
		//HttpEntity<Employee> request = new HttpEntity<Employee>(param, null) ;
		//vo -> query String 
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("employee_id", "4004");
		param.put("first_name", "길동");
		param.put("last_name", "홍");
		param.put("email", "a4@a.aad");
		param.put("hire_date", "2000-12-01");
		param.put("job_id", "IT_PROG");
		
		//header설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		HttpEntity<Map<String, String>> request = new HttpEntity<>(param, headers) ;
		
		ResponseEntity<Employee> result = new RestTemplate().exchange(url, HttpMethod.POST, request, Employee.class);
	
		//이름만 출력
			System.out.println(result.getHeaders());
			System.out.println(result.getBody());
	}
	
	@Test
	public void getForObjectTest() {
		
		RestTemplate rest = new RestTemplate();
		String uri = "http://localhost/myserver/empSelect";
		
		Employee[] emp = rest.getForObject(uri, Employee[].class);
		System.out.println(emp[0].getFirst_name());

	}
	
	//@Test
	public void getForEntityTest() {
		
		RestTemplate rest = new RestTemplate();
		String uri = "http://localhost/myserver/empSelect";
		ResponseEntity<Employee[]> emp = rest.getForEntity(uri, Employee[].class);
		System.out.println(emp.getBody()[0].getFirst_name());
		//System.out.println(emp.getStatusCodeValue());
		
		
	}
	
	
	
}
