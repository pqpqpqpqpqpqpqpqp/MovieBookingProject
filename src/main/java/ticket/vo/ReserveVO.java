package ticket.vo;

public class ReserveVO {
	// SELECT M.MOVIE_NAME, T.THEATER_NAME, SI.SCREEN_DATE,
	// C.CINEMA_NAME ,C.CINEMA_SPECIAL_NAME, SI.SCREEN_START_TIME, C.CINEMA_SEAT
	
	private String movieName;
	private String theaterName;
	private String screenDate;
	private String cinemaName;
	private String cinemaSpecialName;
	private String screenStartTime;
	private String cinemaSeat;
	
	
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public String getScreenDate() {
		return screenDate;
	}
	public void setScreenDate(String screenDate) {
		this.screenDate = screenDate;
	}
	public String getCinemaName() {
		return cinemaName;
	}
	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}
	public String getCinemaSpecialName() {
		return cinemaSpecialName;
	}
	public void setCinemaSpecialName(String cinemaSpecialName) {
		this.cinemaSpecialName = cinemaSpecialName;
	}
	public String getScreenStartTime() {
		return screenStartTime;
	}
	public void setScreenStartTime(String screenStartTime) {
		this.screenStartTime = screenStartTime;
	}
	public String getCinemaSeat() {
		return cinemaSeat;
	}
	public void setCinemaSeat(String cinemaSeat) {
		this.cinemaSeat = cinemaSeat;
	}
	
	

}
