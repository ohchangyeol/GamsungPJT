package site.gamsung.controller.chat;


import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/chat/*")

public class ChatController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// Constructor
	public ChatController() {
		System.out.println(this.getClass());
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "chatroom", method = RequestMethod.GET)
//	public String chatRoom(Locale locale, Model model) {
//	public String chatRoom(HttpServletRequest request, HttpServletResponse response) {
	public String chatRoom(@RequestParam("room") String room, @RequestParam("receiver") String receiver, Model model) {

		System.out.println("Chat Room GET :: \n room => "+ room + " / receiver => " + receiver);
		
		try {
			room = new String(room.getBytes("8859_1"),"UTF-8");
			receiver = new String(receiver.getBytes("8859_1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
//		System.out.println("\n\n "+ room +" , " + receiver);
		
		model.addAttribute("room" , room);
		model.addAttribute("receiver" , receiver);
		
		return "/view/chat/chattingRoom.jsp";
	}
	
	@RequestMapping(value = "chatlist", method = RequestMethod.GET)
//	public String chatRoom(Locale locale, Model model) {
	public String chatlist() {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		//String room = room;
		return "/view/chat/chattingList.jsp";
	}
	
}
