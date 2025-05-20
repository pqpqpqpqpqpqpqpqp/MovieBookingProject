package review;

public class ReviewWriteVO {
	private int userIdx;
	private int movieIdx;
	private String movieName;
	private int reviewScore;
	private String reviewContent;

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public int getMovieIdx() {
		return movieIdx;
	}

	public void setMovieIdx(int movieIdx) {
		this.movieIdx = movieIdx;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

}