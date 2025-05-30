package controller_api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ticket.service.ReserveMovieListService;
import ticket.service.ReserveSeatCheckService;
import ticket.vo.ReserveMovieListVO;

public class TicketController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getServletPath();
		
		List<ReserveMovieListVO> reserveMovieList = new ArrayList<>();
		List<String> reserveSeatList = new ArrayList<>();
		
		Gson gson = new Gson();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (command.equals("/ReserveMovieList.tiw")) {
		    ReserveMovieListService reserveMovieListService = new ReserveMovieListService();
		    reserveMovieList = reserveMovieListService.execute(request, response);

		    out.print(gson.toJson(reserveMovieList));

		} else if (command.equals("/ReserveSeatCheck.tiw")) {
		    ReserveSeatCheckService reserveSeatCheckService = new ReserveSeatCheckService();
		    reserveSeatList = reserveSeatCheckService.execute(request, response);

		    out.print(gson.toJson(reserveSeatList));
		}

		out.flush();
	}
}