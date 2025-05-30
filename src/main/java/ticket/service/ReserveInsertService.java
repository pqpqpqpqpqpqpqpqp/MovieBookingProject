package ticket.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ticket.dao.ReserveInsertDAO;
import ticket.vo.ReserveInsertVO;
import util.ResponseData;

public class ReserveInsertService {
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			int userIdx = Integer.parseInt(request.getParameter("userIdx"));
			String seatName = request.getParameter("seatName");
			int movieIdx = Integer.parseInt(request.getParameter("movieIdx"));
			int cinemaIdx = Integer.parseInt(request.getParameter("cinemaIdx"));
			String screeningDate = request.getParameter("screeningDate");
			String startTime = request.getParameter("startTime");

			ReserveInsertVO reserve = new ReserveInsertVO();
			reserve.setUserIdx(userIdx);
			reserve.setSeatName(seatName);
			reserve.setMovieIdx(movieIdx);
			reserve.setCinemaIdx(cinemaIdx);
			reserve.setScreeningDate(screeningDate);
			reserve.setStartTime(startTime);

			ReserveInsertDAO insert = new ReserveInsertDAO();
			insert.insertReserve(reserve);
			insert.conClose();

			return new ResponseData("예매가 완료되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseData(500, "예매 중 오류가 발생했습니다.");
		}
	}
}