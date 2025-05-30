package ticket.vo;

public class ReserveInsertVO {
	private int userIdx;
	private String seatName;
	private int movieIdx;
	private int cinemaIdx;
	private String screeningDate;
	private String startTime;

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

	public int getMovieIdx() {
		return movieIdx;
	}

	public void setMovieIdx(int movieIdx) {
		this.movieIdx = movieIdx;
	}

	public int getCinemaIdx() {
		return cinemaIdx;
	}

	public void setCinemaIdx(int cinemaIdx) {
		this.cinemaIdx = cinemaIdx;
	}

	public String getScreeningDate() {
		return screeningDate;
	}

	public void setScreeningDate(String screeningDate) {
		this.screeningDate = screeningDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
}