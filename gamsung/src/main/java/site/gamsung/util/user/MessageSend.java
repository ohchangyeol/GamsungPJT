package site.gamsung.util.user;

import java.util.Random;

public class MessageSend {

	public static void main(String[] args) {
		
		Random rand  = new Random();
        
        String numStr = "";
        
        for(int i=0; i<4; i++) {
        	
            String num = Integer.toString(rand.nextInt(10));
            
            numStr += num;
        }	   
		
		SendMessage send = new SendMessage();
		send.sendMessage("010-4515-2520", numStr);
	}

}
