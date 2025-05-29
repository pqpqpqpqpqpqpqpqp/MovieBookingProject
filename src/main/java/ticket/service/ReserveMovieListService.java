package ticket.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ticket.dao.ReserveMovieListDAO;
import ticket.vo.ReserveMovieListVO;

public class ReserveMovieListService {

	public List<ReserveMovieListVO> execute(HttpServletRequest request, HttpServletResponse response) {

		List<ReserveMovieListVO> movieReserveList = new ArrayList<>();
		ReserveMovieListDAO reserveMovieListDAO = new ReserveMovieListDAO();

		movieReserveList.addAll(reserveMovieListDAO.readReserveMovieList());
		reserveMovieListDAO.conClose();

		return movieReserveList;
	}
}