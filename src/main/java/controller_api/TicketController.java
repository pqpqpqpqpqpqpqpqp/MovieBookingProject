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

import ticket.service.TicketReserveService;
import ticket.vo.ReserveVO;
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
		
		String url = request.getRequestURI(); // /서버path/url(mapping)
		String path = request.getContextPath();// /서버path
		String command = url.substring(path.length()); // /url(mapping)
		System.out.println("api호출: " + command);

		Gson gson = new Gson();
		List<ReserveVO> reserveArr = null; // response 값
		
		if(command.equals("/testReserve.tiw")) {
			reserveArr = new ArrayList<>();
			TicketReserveService ReserveService = new TicketReserveService();
			reserveArr = ReserveService.execute(request, response);
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print(gson.toJson(reserveArr));
		out.flush();

	}

}
