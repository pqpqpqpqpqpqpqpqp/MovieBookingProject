package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.service.WriteReviewService;
import util.ResponseData;


public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPocess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPocess(request, response);
	}

	protected void doPocess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getServletPath();
		System.out.println("api호출: " + command);
		
		Gson gson = new Gson();
		ResponseData responseData = null; // response 값
		
		if(command.equals("/review.re")) {
			WriteReviewService service = new WriteReviewService();
			responseData = service.execute(request, response);
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(responseData));
		out.flush();
	}
}