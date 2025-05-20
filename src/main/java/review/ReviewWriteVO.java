package review;

public class ReviewWriteVO {
	private int userIdx;
	private int movieIdx;
	private int bookingIdx;
	private String movieName;
	private int reviewRating;
	private String reviewText;

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

	public int getBookingIdx() {
		return bookingIdx;
	}

	public void setBookingIdx(int bookingIdx) {
		this.bookingIdx = bookingIdx;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public int getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}

	public String getReviewText() {
		return reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

}