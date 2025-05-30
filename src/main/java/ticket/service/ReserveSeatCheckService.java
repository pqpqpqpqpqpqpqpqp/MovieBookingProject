package ticket.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ticket.dao.ReserveSeatCheckDAO;
import ticket.vo.ReserveSeatCheckVO;

public class ReserveSeatCheckService {
	public List<String> execute(HttpServletRequest request, HttpServletResponse response) {

		List<String> seatReserveList = new ArrayList<>();
		ReserveSeatCheckDAO reserveSeatCheckDAO = new ReserveSeatCheckDAO();
		ReserveSeatCheckVO reserveSeatCheckVO = new ReserveSeatCheckVO();
		
		reserveSeatCheckVO.setMovieName(request.getParameter("movieName"));
		reserveSeatCheckVO.setCinemaName(request.getParameter("cinemaName"));
		reserveSeatCheckVO.setTheaterName(request.getParameter("theaterName"));
		reserveSeatCheckVO.setDate(request.getParameter("date"));
		reserveSeatCheckVO.setStartTime(request.getParameter("startTime"));
		
		seatReserveList = reserveSeatCheckDAO.checkReserveSeat(reserveSeatCheckVO);

		return seatReserveList;
	}
}