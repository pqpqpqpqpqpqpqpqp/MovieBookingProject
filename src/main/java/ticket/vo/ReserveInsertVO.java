package ticket.vo;

public class ReserveInsertVO {
	private int userIdx;
	private String seatName;
	private String movieTitle;
	private String theaterTitle;
	private String dateTime;

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public String getSeatName() {
		return seatName;
	}

	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getTheaterTitle() {
		return theaterTitle;
	}

	public void setTheaterTitle(String theaterTitle) {
		this.theaterTitle = theaterTitle;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
}