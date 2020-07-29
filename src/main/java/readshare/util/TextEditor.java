package readshare.util;

import org.springframework.stereotype.Component;

@Component
public class TextEditor {

	public String removespace(String string) {

		StringBuffer sb = new StringBuffer();// 用其他方法实现

		int flag;

		for (int i = 0; i < string.length(); i++) {
			flag = 0;
			if (string.charAt(i) != ' ') {
				sb.append(string.charAt(i));
			} else {
				flag = 1;
			}
			try {
				if (string.charAt(i) == ' ' && string.charAt(i + 1) != ' ') {
					sb.append(' ');
				}
			} catch (Exception e) {
				continue;
			}
		}
		// System.out.println(sb);
		return sb.toString();
	}

	public String addp(String string) {

		StringBuffer sb = new StringBuffer();// 用其他方法实现

		for (int i = 0; i < string.length(); i++) {
			
			String f="\\r\\n";
			
			if (string.charAt(i) != 'f') {
				sb.append(string.charAt(i));
			}
				
//		while(string.indexOf("\r\n")>0) {
//			
//		}

			if (string.charAt(i) == '\\' && string.charAt(i + 1) == 'r' && string.charAt(i + 2) == '\\'
					&& string.charAt(i + 3) == 'n') {
								
				sb.append("<br>");
				
				System.out.println("hihihi"+i);
			}

		}
		// System.out.println(sb);
		return sb.toString();

	}

	public static void main(String[] args) {
//		String string="s ad asd asd asdf kljl";
//		TextEditor clean = new TextEditor();
//		String nospace = clean.removespace(string);
//		System.out.println("-----------------------------------------");
//		String nor=nospace.replaceAll( "\r" , "<br>");
//		System.out.println("nor="+nor);
//		System.out.println("---------------------------------------------");
//		String transf="<p>"+nor.replaceAll(" ", "</p><p>")+"</p>";
//		System.out.println("transf="+transf);
		
	}

}
