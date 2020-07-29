package howard.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class TestDateTimeFormate {

	public static void main(String[] args) throws ParseException {
		
		SimpleDateFormat date = new SimpleDateFormat("MMM dd, yyyy HH:mm:ss a",Locale.ENGLISH);//"Sep 11, 2018 10:58:03 PM"
		
		System.out.println(date.format(new java.util.Date()));
		
		Date tempDate = date.parse("Sep 11, 2018 10:58:03 PM");
		
		
		System.out.println(tempDate);
		
		
	}

}
