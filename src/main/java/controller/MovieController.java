package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import movie.service.MovieDetailService;
import util.ResponseData;

public class MovieController extends HttpServlet {

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
		
		ResponseData responseData = null; // response 값
		
		if (command.equals("/movieDetail.mow")) {
		    MovieDetailService action = new MovieDetailService();
		    ResponseData result = action.execute(request, response);

		    if (result.getCode() == 200) {
		        request.setAttribute("movie", result.getData());
		        request.getRequestDispatcher("/view/movie/detail.jsp").forward(request, response);
		    } else {
		        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "영화 정보 조회 실패");
		    }
		    return; // JSON 응답 안 보내도록 여기서 리턴
		}


		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print(gson.toJson(responseData));
		out.flush();

	}

}
