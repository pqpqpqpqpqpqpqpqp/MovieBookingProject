package movie.vo;

public class MovieUserListRes {

	private long movieIdx;					//movie 테이블 idx
	private String movieChartAgeGrade;
	private String movieChartImg;
	private String movieChartName;
	private Double movieChartReviewScore;
	private String movieChartOpenDate;
	private String movieChartCount;
	
	
	
	public long getMovieIdx() {
		return movieIdx;
	}
	public void setMovieIdx(long movieIdx) {
		this.movieIdx = movieIdx;
	}
	
	public String getMovieChartAgeGrade() {
		return movieChartAgeGrade;
	}
	public void setMovieChartAgeGrade(String movieChartAgeGrade) {
		this.movieChartAgeGrade = movieChartAgeGrade;
	}
	public String getMovieChartImg() {
		return movieChartImg;
	}
	public void setMovieChartImg(String movieChartImg) {
		this.movieChartImg = movieChartImg;
	}
	public String getMovieChartName() {
		return movieChartName;
	}
	public void setMovieChartName(String movieChartName) {
		this.movieChartName = movieChartName;
	}
	public Double getMovieChartReviewScore() {
		return movieChartReviewScore;
	}
	public void setMovieChartReviewScore(Double movieChartReviewScore) {
		this.movieChartReviewScore = movieChartReviewScore;
	}
	public String getMovieChartOpenDate() {
		return movieChartOpenDate;
	}
	public void setMovieChartOpenDate(String movieChartOpenDate) {
		this.movieChartOpenDate = movieChartOpenDate;
	}
	public String getMovieChartCount() {
		return movieChartCount;
	}
	public void setMovieChartCount(String movieChartCount) {
		this.movieChartCount = movieChartCount;
	}
	
	
}
