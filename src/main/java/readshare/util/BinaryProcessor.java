package readshare.util;

import java.util.Base64;

import org.springframework.stereotype.Component;

@Component
public class BinaryProcessor {

	public String BinaryToBase64(byte[] img) {

		if (img != null) {
			final Base64.Encoder encoder = Base64.getEncoder();
			return "data:image//jpeg;base64," + encoder.encodeToString(img);
		}
		System.out.println("Your img is null while you calling BinaryToBase64!");
		return null;
	}
}
