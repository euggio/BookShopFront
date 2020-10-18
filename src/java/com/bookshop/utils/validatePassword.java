import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
 
public class validatePassword {
 
	public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {
                
                // Method to generate salt
		byte[] salt = getRandomSalt();
		System.out.println(Base64.getEncoder().encodeToString(salt));
                
                // Hasshing password + salt
		byte[] password = "MotDePassEnClair".getBytes("UTF-8");
		System.out.println(hashPass(password, salt));
		System.out.println(hashPass("MotDePassEnClair", salt));
	}
 
	private static byte[] getRandomSalt() throws NoSuchAlgorithmException {
		// Uses a secure Random not a simple Random
		// Salt generation 64 bits long
		byte[] bSalt = new byte[8];
 
		SecureRandom.getInstance("SHA1PRNG").nextBytes(bSalt);
		return bSalt;
	}
 
	private static String hashPass(byte[] password, byte[] salt) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return Base64.getEncoder().encodeToString(md.digest(combine(salt, password)));
	}
 
	private static String hashPass(String password, byte[] salt) throws UnsupportedEncodingException {
		return hashPass(password.getBytes("UTF-8"),salt);
	}
 
	public static byte[] combine(byte[] a, byte[] b) {
		byte[] c = new byte[a.length + b.length];
		System.arraycopy(a, 0, c, 0, a.length);
		System.arraycopy(b, 0, c, a.length, b.length);
		return c;
	}
 
}