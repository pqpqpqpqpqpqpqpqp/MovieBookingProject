package ticket.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ticket.dao.ReserveSeatCheckDAO;

public class ReserveSeatCheckService {

	public List<String> execute(HttpServletRequest request, HttpServletResponse response) {

		List<String> seatReserveList = new ArrayList<>();
		ReserveSeatCheckDAO reserveSeatCheckDAO = new ReserveSeatCheckDAO();
		
		seatReserveList = reserveSeatCheckDAO.checkReserveSeat();

		return seatReserveList;
	}
}