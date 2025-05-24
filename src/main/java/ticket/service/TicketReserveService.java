package ticket.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ticket.dao.ReserveDAO;
import ticket.vo.ReserveVO;

public class TicketReserveService {

	public List<ReserveVO> execute(HttpServletRequest request, HttpServletResponse response) {

		List<ReserveVO> reserveArr = new ArrayList<>();
		ReserveDAO reserveDAO = new ReserveDAO();

		reserveArr.addAll(reserveDAO.readScreenInfo());

		return reserveArr;
	}
}