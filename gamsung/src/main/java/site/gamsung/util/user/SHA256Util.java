package site.gamsung.util.user;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class SHA256Util {
	
	/** 
	 * SHA-256 암호화 함 
	 * @param source 원본
	 * @param salt(String) SALT 값
	 * @return */ 
	public static String getEncrypt(String source, String salt) { 
		
		return getEncrypt(source, salt.getBytes()); 
	} 
	
	/** 
	 * SHA-256 암호화 함 
	 * @param source 원본 
	 * @param salt(byte[]) SALT 값 
	 * @return */ 
	public static String getEncrypt(String source, byte[] salt) { 
		
		String result = "";
		byte[] a = source.getBytes();
		byte[] bytes = new byte[a.length + salt.length];
		//System.arraycopy Method 배열의 복사
		//System.arraycopy(이전배열이름, 이전배열 시작 인덱스, 새배열이름, 새배열시작인덱스, 복사할 개수);
		System.arraycopy(a, 0, bytes, 0, a.length);
		System.arraycopy(salt, 0, bytes, a.length, salt.length); 
		
		try { 
			// 암호화 방식 지정 메소드
			MessageDigest md = MessageDigest.getInstance("SHA-256"); 
			md.update(bytes); 
			byte[] byteData = md.digest(); 
			StringBuffer sb = new StringBuffer(); 
			
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xFF) + 256, 16).substring(1)); 
				} 
			result = sb.toString(); 
			} catch (NoSuchAlgorithmException noe) {
				noe.printStackTrace(); 
			} catch(Exception e) {
				e.printStackTrace();
			}return result; 
		}
	
	/** 
	 * * SALT 값을 얻어온다. 
	 * * @return */
	
	public static String generateSalt() { 
		
		Random random = new Random(); 
		byte[] salt = new byte[8]; 
		random.nextBytes(salt); 
		
		StringBuffer sb = new StringBuffer();
		
		for (int i = 0; i < salt.length; i++) { 
			// byte 값을 Hex 값으로 바꾸기. 
			sb.append(String.format("%02x",salt[i])); 
			} 
		return sb.toString(); 
		}
	
}




