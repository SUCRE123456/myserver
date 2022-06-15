package com.yedam.myserver;

public class ThreadTest {

	public static void main(String[] args) throws InterruptedException {
		
		Task1Tread thread1 = new Task1Tread();
		thread1.start();
			
		for(int i=1000; i<1100; i++) {
			System.out.println(i);
			Thread.sleep(100);
		}
	}

}
