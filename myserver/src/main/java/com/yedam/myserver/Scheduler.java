package com.yedam.myserver;

import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	
	//@Scheduled(cron = "0/10 * * * * *")
	public void task1() {
		System.out.println("테스트 실행");
	}
}
