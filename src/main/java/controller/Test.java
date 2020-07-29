package controller;

import java.util.Random;

public class Test {

	public static void main(String[] args) {
		int a=(int)((Math.random())*10000000);
		System.out.println("a="+a);
			
		 String stringValue = Integer.toString(a);
			System.out.println("stringValue="+stringValue);
			
			 Random r = new Random();
			 char c = (char)(r.nextInt(26) + 'a');
			 char c1 = (char)(r.nextInt(26) + 'a');
			 String orderticket = c+""+c1+stringValue;
			 
			 int rnd = (int) (Math.random() * 52); // or use Random or whatever
			    char base = (rnd < 26) ? 'A' : 'a';
			     char zz = (char) (base + rnd % 26);
			  
			     System.out.println("zz="+zz);
			     
			     int rnd1 = (int) (Math.random() * 52); // or use Random or whatever
				    char base1 = (rnd1 < 26) ? 'A' : 'a';
				   
				     char zz1=(char) (base1 + rnd1 % 26);
			     System.out.println("zz1="+zz1);
			     
			     String tre = zz+""+zz1+stringValue;
			     System.out.println("tre="+tre);
			    
			 System.out.println("orderticket="+orderticket);
	}

}
