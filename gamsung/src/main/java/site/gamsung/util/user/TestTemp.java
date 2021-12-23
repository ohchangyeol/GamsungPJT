package site.gamsung.util.user;


public class TestTemp {


	public static void main(String[] args) throws Exception{
		
	SHA256Util a= new SHA256Util();
	String salt = a.generateSalt();
	String pw=a.getEncrypt("1234", salt);
	
	System.out.println("salt"+salt);
	System.out.println("pw"+pw);


	}

}
