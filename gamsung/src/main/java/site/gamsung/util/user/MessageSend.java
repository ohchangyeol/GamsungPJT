package site.gamsung.util.user;

public class MessageSend {

	public static void main(String[] args) {
		
		String text = "메리크리스마스~~!!\n"	+ 
					  "한해 동안 수고 많았어요~~!!\n" +
					  "**^^**";
		
		SendMessage send = new SendMessage();
		send.sendMessage("010-9348-3922", text);
	}

}
