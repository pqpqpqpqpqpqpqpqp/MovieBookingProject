package movie.vo;

public class MovieWatchedVO {
	
	private String userName; //유저이름 >> 이건 안쓰는데 혹시몰라서만듬
	private String userId;    //유저 아이디>> 이건 안쓰는데 혹시몰라서만듬
	private int movieIdx;
	private String userNick;  //유저닉네임  >> 이건 안쓰는데 혹시몰라서만듬
	private String movieName; // 영화제목
	private String watchDate; // 상영날짜
	private String weekday;   // 요일
	private String screenTime;// 상영시간
	private String movieImg;
	private String screenStartTime;
	private String screenEndTime;
	private String thciName;
	private String theatherName; //영화관지점
	private String cinemaNum; //상영관(1관,2관)
	private String cinemaSpecialName;  //특별관정보
	private int 	screenNum; 	//예매 수
	private String seatNum; //좌석 정보
	private int reviewScore; //리뷰 점수
	
	
	

	public int getMovieIdx() {
		return movieIdx;
	}
	public void setMovieIdx(int movieIdx) {
		this.movieIdx = movieIdx;
	}
	public String getThciName() {
		return thciName;
	}
	public void setThciName(String thciName) {
		this.thciName = thciName;
	}
	public String getMovieImg() {
		return movieImg;
	}
	public void setMovieImg(String movieImg) {
		this.movieImg = movieImg;
	}
	public String getScreenStartTime() {
		return screenStartTime;
	}
	public void setScreenStartTime(String screenStartTime) {
		this.screenStartTime = screenStartTime;
	}
	public String getScreenEndTime() {
		return screenEndTime;
	}
	public void setScreenEndTime(String screenEndTime) {
		this.screenEndTime = screenEndTime;
	}
	public String getCinemaSpecialName() {
		return cinemaSpecialName;
	}
	public void setCinemaSpecialName(String cinemaSpecialName) {
		this.cinemaSpecialName = cinemaSpecialName;
	}
	public String getCinemaNum() {
		return cinemaNum;
	}
	public void setCinemaNum(String cinemaNum) {
		this.cinemaNum = cinemaNum;
	}
	public String getTheatherName() {
		return theatherName;
	}
	public void setTheatherName(String theatherName) {
		this.theatherName = theatherName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getWatchDate() {
		return watchDate;
	}
	public void setWatchDate(String watchDate) {
		this.watchDate = watchDate;
	}
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
	public String getScreenTime() {
		return screenTime;
	}
	public void setScreenTime(String screenTime) {
		this.screenTime = screenTime;
	}
	public String getTheaterName() {
		return theatherName;
	}
	public void setTheaterName(String theaterName) {
		this.theatherName = theaterName;
	}
	public int getScreenNum() {
		return screenNum;
	}
	public void setScreenNum(int screenNum) {
		this.screenNum = screenNum;
	}
	
	
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	
	
}
