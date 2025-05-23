package movie.vo;

public class MovieDetailAgeGraphRes {

	private String ageGroup;
	private int count;
	
	public MovieDetailAgeGraphRes() {}
	
	public MovieDetailAgeGraphRes(String ageGroup, int count) {		
		
		this.ageGroup = ageGroup;
		this.count = count;
		
	}

	public String getAgeGroup() {
		return ageGroup;
	}

	public void setAgeGroup(String ageGroup) {
		this.ageGroup = ageGroup;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
}
