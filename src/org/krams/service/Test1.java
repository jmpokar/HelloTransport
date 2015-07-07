package org.krams.service;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Test1 {
	
	public static void main(String[] args) {
		new Test1();  
	}
	Test1(){
		BufferedInputStream file= (BufferedInputStream) this.getClass().getResourceAsStream("../../../resources/a.txt");
		try {
			System.out.println((char)file.read());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
