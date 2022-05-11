package com.yedam.myserver;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

import org.junit.Test;

public class StreamTest {

	
	//Stream : byte 단위
	//reader : char
		//@Test
	/*	
	public void FileCopy() throws Exception {
			FileInputStream in = FileInputStream(new File("dept.json"));
			FileOutputStream out = FileOutputStream(new File("dept2.json"));
			int result;
			while((result = in.read()) != -1) {
				out.write(result);
			}
			in.close();
			out.close();
			}
			*/
		
		@Test
		public void FileTest() throws Exception {
			FileInputStream in = new FileInputStream(new File("dept.txt"));
			InputStreamReader isr = new InputStreamReader(in); 
			BufferedReader br = new BufferedReader(isr); 
			
			String result;
			
			while((result = br.readLine()) != null) {
				System.out.println(result);
				}
			
			}
		
}
