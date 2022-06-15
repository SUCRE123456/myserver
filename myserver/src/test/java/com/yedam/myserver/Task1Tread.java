package com.yedam.myserver;

public class Task1Tread extends Thread {

	@Override
	public void run() {
		
		for(int i=0; i<100; i++){
			System.out.println(i);
			
			try {
				this.sleep(100);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
