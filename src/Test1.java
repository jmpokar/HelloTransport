import java.io.File;
import java.io.FileInputStream;
import java.util.Scanner;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class Test1 {

	public static void main(String[] args) {
		
		
		
		
		A a1 = new A();
		A a2 = new A();
		A a3 = a1;
		
		System.out.println(a1==a2);
		System.out.println(a1.equals(a2));
		System.out.println(a1.equals(a3));
		System.out.println(a1==a3);
		
		
		B d = new B();
		System.out.println(d);
		d=null;
		System.gc();
		
		new Test1();
	}


	public Test1(){

		
		
		
		
		String aString= "abcdef";
		
		System.out.println(aString.indexOf('c'));
		System.out.println(aString.indexOf("de"));
		
		
		String newString = aString.replaceAll("(..)", "$1 ");
		System.out.println(newString);		
				
				
		String data = "\"1234\"";
		if(data.startsWith("\"") && data.endsWith("\"")){
			System.out.println(data.substring(1,data.length()-1));	
		}
		
		
		try {
			JSONObject json = new JSONObject();

			JSONArray jsonArr = new JSONArray();

			JSONArray list = new JSONArray();
			list.put("rec1");
			list.put("msg1");

			JSONArray list1 = new JSONArray();
			list1.put("rec2");
			list1.put("msg2");

			jsonArr.put(list);
			jsonArr.put(list1);

			json.put("recipientDetails", jsonArr);


			String jsonString = json.toString();
			System.out.println(jsonString);

			System.out.println("PARSING STARTED");

			JSONObject jsonObj1 = new JSONObject(jsonString);
			JSONArray jsonArr1 = jsonObj1.getJSONArray("recipientDetails");
			
			
			String rec;
			String details;
			for (int i = 0; i < jsonArr1.length(); i++) {
				JSONArray det = (JSONArray)jsonArr1.get(i);

				rec = (String)det.getString(0);
				details = (String)det.getString(1);
				
				System.out.println(rec + " = " + details);
				System.out.println("-------");
				
				
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}







	}

}

class A{
	public String data="hello";
}

class B{
	B(){
		System.out.println("B.B()");
	}

	@Override
	protected void finalize() throws Throwable {
		System.out.println("B.finalize()");
		super.finalize();
	}

}

class C extends B{
	C(){
		System.out.println("C.C()");
	}
	
	@Override
	protected void finalize() throws Throwable {
		System.out.println("C.finalize()");
		super.finalize();
	}
}


class D extends C{
	D(){
		System.out.println("D.D()");
	}
	
	@Override
	protected void finalize() throws Throwable {
		System.out.println("D.finalize()");
		//super.finalize();
	}
}

