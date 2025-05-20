package movie.vo;

public class MovieDetailRes {
	
	private String movieImg;
	private String movieName;
	private String movieCreator;
	private String movieAgeGrade;
	private String moviePlayTime;
	private String movieOpenDate;
	private String movieDsec;
	
	private String  peviewAvg;			//영화 평점
	private String  ticketingCnt;		//티케팅 예매 건수
	
	
	
	public String getPeviewAvg() {
		return peviewAvg;
	}
	public void setPeviewAvg(String peviewAvg) {
		this.peviewAvg = peviewAvg;
	}
	public String getTicketingCnt() {
		return ticketingCnt;
	}
	public void setTicketingCnt(String ticketingCnt) {
		this.ticketingCnt = ticketingCnt;
	}
	public String getMovieImg() {
		return movieImg;
	}
	public void setMovieImg(String movieImg) {
		this.movieImg = movieImg;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieCreator() {
		return movieCreator;
	}
	public void setMovieCreator(String movieCreator) {
		this.movieCreator = movieCreator;
	}
	public String getMovieAgeGrade() {
		return movieAgeGrade;
	}
	public void setMovieAgeGrade(String movieAgeGrade) {
		this.movieAgeGrade = movieAgeGrade;
	}
	public String getMoviePlayTime() {
		return moviePlayTime;
	}
	public void setMoviePlayTime(String moviePlayTime) {
		this.moviePlayTime = moviePlayTime;
	}
	public String getMovieOpenDate() {
		return movieOpenDate;
	}
	public void setMovieOpenDate(String movieOpenDate) {
		this.movieOpenDate = movieOpenDate;
	}
	public String getMovieDsec() {
		return movieDsec;
	}
	public void setMovieDsec(String movieDsec) {
		this.movieDsec = movieDsec;
	}
	
	
	

}
