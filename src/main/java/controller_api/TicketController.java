package controller_api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.service.MemberIdCheckService;
import member.service.MemberLoginService;
import member.service.MemberRegisterService;
import ticket.service.TicketReserveService;
import util.ResponseData;

public class TicketController extends HttpServlet {

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
		ResponseData responseData = null; // response 값
		
		if(command.equals("/testReserve.tiw")) {
			TicketReserveService action = new TicketReserveService();
			responseData = action.execute(request, response);
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print(gson.toJson(responseData));
		out.flush();

	}

}
