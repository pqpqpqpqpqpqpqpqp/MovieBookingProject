package movie.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dao.MovieDetailDAO;
import movie.vo.MovieDetailAgeGraphDTO;
import movie.vo.MovieDetailAgeGraphRes;
import util.ResponseData;

public class getAgeTicketCountService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		int movieIdx = Integer.parseInt(request.getParameter("movieIdx"));

		MovieDetailDAO movieDetailDAO = new MovieDetailDAO();

		ResponseData data = new ResponseData();

		try {

			List<MovieDetailAgeGraphDTO> list = movieDetailDAO.getAgeGroupTicketCount(movieIdx);
			MovieDetailAgeGraphRes res = new MovieDetailAgeGraphRes();

			int sum = 0;
			
			for (int i = 0; i < list.size(); i++) {
				MovieDetailAgeGraphDTO dto = list.get(i);

				sum += dto.getCount();
				
				switch (dto.getAgeGroup()) {

				case 0:
				case 10:
					res.setAge10(dto.getCount());
					break;
				case 20:
					res.setAge20(dto.getCount());
					break;
				case 30:
					res.setAge30(dto.getCount());
					break;
				case 40:
					res.setAge40(dto.getCount());
					break;
				case 50:
					res.setAge50(res.getAge50() + dto.getCount());
					break;
				default:
					break;

				}
				
			}
			res.setAgeAll(sum);
			
			data.setData(res);

		} catch (Exception e) {
			data.setCode(500);
			e.printStackTrace();
		} finally {
			movieDetailDAO.conClose();
		}

		return data;
	}

}
