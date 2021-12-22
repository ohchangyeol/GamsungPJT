package site.gamsung.service.domain;

public class ReservationStatistics {

	private String campID;
	private String campName;
	private String date;
	private String start;
	private String end;
	private int totalCount;
	private int dayCount;
	private int weekCount;
	private int monthCount;
	private int yearCount;
	private int beforeYearDayCount;
	private int beforeYearWeekCount;
	private int beforeYearMonthCount;
	private int beforeYearYearCount;
	
	public ReservationStatistics() {
		
	}

	public String getCampID() {
		return campID;
	}

	public void setCampID(String campID) {
		this.campID = campID;
	}

	public String getCampName() {
		return campName;
	}

	public void setCampName(String campName) {
		this.campName = campName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getDayCount() {
		return dayCount;
	}

	public void setDayCount(int dayCount) {
		this.dayCount = dayCount;
	}

	public int getWeekCount() {
		return weekCount;
	}

	public void setWeekCount(int weekCount) {
		this.weekCount = weekCount;
	}

	public int getMonthCount() {
		return monthCount;
	}

	public void setMonthCount(int monthCount) {
		this.monthCount = monthCount;
	}

	public int getYearCount() {
		return yearCount;
	}

	public void setYearCount(int yearCount) {
		this.yearCount = yearCount;
	}

	public int getBeforeYearDayCount() {
		return beforeYearDayCount;
	}

	public void setBeforeYearDayCount(int beforeYearDayCount) {
		this.beforeYearDayCount = beforeYearDayCount;
	}

	public int getBeforeYearWeekCount() {
		return beforeYearWeekCount;
	}

	public void setBeforeYearWeekCount(int beforeYearWeekCount) {
		this.beforeYearWeekCount = beforeYearWeekCount;
	}

	public int getBeforeYearMonthCount() {
		return beforeYearMonthCount;
	}

	public void setBeforeYearMonthCount(int beforeYearMonthCount) {
		this.beforeYearMonthCount = beforeYearMonthCount;
	}

	public int getBeforeYearYearCount() {
		return beforeYearYearCount;
	}

	public void setBeforeYearYearCount(int beforeYearYearCount) {
		this.beforeYearYearCount = beforeYearYearCount;
	}

	@Override
	public String toString() {
		return "ReservationStatistics [campID=" + campID + ", campName=" + campName + ", date=" + date + ", start="
				+ start + ", end=" + end + ", totalCount=" + totalCount + ", dayCount=" + dayCount + ", weekCount="
				+ weekCount + ", monthCount=" + monthCount + ", yearCount=" + yearCount + ", beforeYearDayCount="
				+ beforeYearDayCount + ", beforeYearWeekCount=" + beforeYearWeekCount + ", beforeYearMonthCount="
				+ beforeYearMonthCount + ", beforeYearYearCount=" + beforeYearYearCount + "]\n";
	}
	
}
