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

import ticket.service.ReserveInsertService;
import ticket.service.ReserveMovieListService;
import ticket.service.ReserveSeatCheckService;
import ticket.vo.ReserveMovieListVO;
import util.ResponseData;

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
		System.out.println(command);

		List<ReserveMovieListVO> reserveMovieList = new ArrayList<>();
		List<String> reserveSeatList = new ArrayList<>();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();

		if (command.equals("/ReserveMovieList.tiw")) {
			ReserveMovieListService reserveMovieListService = new ReserveMovieListService();
			reserveMovieList = reserveMovieListService.execute(request, response);

			out.print(gson.toJson(reserveMovieList));
			
		} else if (command.equals("/ReserveSeatCheck.tiw")) {
			ReserveSeatCheckService reserveSeatCheckService = new ReserveSeatCheckService();
			reserveSeatList = reserveSeatCheckService.execute(request, response);

			out.print(gson.toJson(reserveSeatList));
		} else if (command.equals("/ReserveInsert.tiw")) {
			ReserveInsertService reserveInsertService = new ReserveInsertService();
			ResponseData result = reserveInsertService.execute(request, response);
			
			out.print(gson.toJson(result));
		}
		
		out.flush();
	}
}