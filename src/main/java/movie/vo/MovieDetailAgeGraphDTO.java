package movie.vo;

/***
 * DAO로부터 값 추출
 */
public class MovieDetailAgeGraphDTO {

	private int ageGroup;
	private int count;
	
	public MovieDetailAgeGraphDTO() {}
	
	public MovieDetailAgeGraphDTO(int ageGroup, int count) {		
		
		this.ageGroup = ageGroup;
		this.count = count;
		
	}

	public int getAgeGroup() {
		return ageGroup;
	}

	public int getCount() {
		return count;
	}

	
}
