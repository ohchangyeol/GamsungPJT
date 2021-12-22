package site.gamsung.util.user;

public class TempPassword {
	
	public String random10(){
		
	       StringBuilder tmp = new StringBuilder();
	       for(int i=0; i<10; i++) {
	           int div = (int) Math.floor( Math.random() * 2 );

	           if(div == 0) { 
	               tmp.append((char) (Math.random() * 10 + '0'));
	           }else { 
	               tmp.append((char) (Math.random() * 26 + 'A'));
	           }
	       }
	       return tmp.toString();
	   }
}
