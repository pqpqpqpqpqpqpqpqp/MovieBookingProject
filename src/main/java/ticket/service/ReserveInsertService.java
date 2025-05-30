package ticket.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ticket.dao.ReserveInsertDAO;
import ticket.vo.ReserveInsertVO;

public class ReserveInsertService {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int userIdx = Integer.parseInt(request.getParameter("userIdx"));
	    String seatName = request.getParameter("seatName");
	    String movieTitle = request.getParameter("movieTitle");
	    String theaterTitle = request.getParameter("theaterTitle");
	    String dateTime = request.getParameter("dateTime");

	    ReserveInsertVO reserve = new ReserveInsertVO();
	    reserve.setUserIdx(userIdx);
	    reserve.setSeatName(seatName);
	    reserve.setMovieTitle(movieTitle);
	    reserve.setTheaterTitle(theaterTitle);
	    reserve.setDateTime(dateTime);
	    
	    ReserveInsertDAO insert = new ReserveInsertDAO();
	    insert.insertReserve();
	    insert.conClose();

	}
}