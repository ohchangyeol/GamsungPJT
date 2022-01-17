package site.gamsung.service.domain;

import java.util.Date;

public class ReservationCalendar {
	
	private String title;
	private Date start;
	private Date end;
	private String url;
	private String color;
	private String textColor;
	private boolean allDay = false;
	
	/// Default Constructor
	public ReservationCalendar() {
		
	}
	
	/// Getter / Setter	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

	// Override toString
	public String toString() {
		return "\n -- ReservationCalendar --"
			+ "\n [title] : " + title
			+ "\n [start] : " + start
			+ "\n [end] : " + end
			+ "\n [url] : " + url
			+ "\n [color] : " + color				
			+ "\n [textColor] : " + textColor
			+ "\n [allDay] : " + allDay 
			+ "\n ---------------- \n";
	}

}
