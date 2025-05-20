package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import review.ReviewListService;
import review.ReviewWriteService;
import util.ResponseData;

public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getServletPath();
		System.out.println("api호출: " + command);

		Gson gson = new Gson();
		ResponseData responseData = null; // response 값

		try {
			if (command.equals("/reviewWrite.re")) {
				ReviewWriteService service = new ReviewWriteService();
				responseData = service.execute(request, response);
			} else if (command.equals("/myReviewList.re")) {
				ReviewListService service = new ReviewListService();
				responseData = service.execute(request, response);
			} else if (command.equals("/movieReviewList.re")) {
				ReviewListService service = new ReviewListService();
				responseData = service.execute(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			responseData = new ResponseData(500, "서버 오류가 발생했습니다.");
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print(gson.toJson(responseData));
		out.flush();
	}
}