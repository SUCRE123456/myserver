package com.yedam.myserver;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.junit.Test;

import com.yedam.myserver.emp.vo.Employee;

/*class Mycomp implements Comparator<Employee>{

	@Override
	public int compare(Employee o1, Employee o2) {
		// TODO Auto-generated method stub
		return o1.getFirst_name().compareTo(o2.getFirst_name());
	}
	
}*/
public class MyList {
	@Test
	public void test1() {
		//무명클래스
		
		List<Employee> list = new ArrayList<Employee>();
		list.add(new Employee("홍길동"));
		list.add(new Employee("김길동"));
		//list.sort(new Mycomp());
		list.sort((Employee o1, Employee o2) -> o1.getFirst_name().compareTo(o2.getFirst_name()) );
		
		
		
		System.out.println(list);
	}
	

}
