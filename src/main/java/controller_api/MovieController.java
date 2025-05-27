package controller_api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import movie.service.MovieDetailReviewService;
import movie.service.MovieDetailService;
import movie.service.MovieUserListService;
import movie.service.getAgeTicketCountService;
import movie.service.getGenderTicketCountService;
import util.ResponseData;

public class MovieController extends HttpServlet {
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
		
		String url = request.getRequestURI(); // /서버path/url(mapping)
		String path = request.getContextPath();// /서버path
		String command = url.substring(path.length()); // /url(mapping)
		System.out.println("api호출: " + command);
		
		Gson gson = new Gson();
		ResponseData responseData = null;
		
		if(command.equals("/MovieChart.mo")) {
			MovieUserListService service = new MovieUserListService();
			responseData = service.execute(request, response);
		}
		else if(command.equals("/MovieDetail.mo")) {
			MovieDetailService detservice = new MovieDetailService();
			responseData = detservice.execute(request, response);
		}
		else if(command.equals("/MovieDetailGenderGraph.mo")) {
			getGenderTicketCountService genderCountservice = new getGenderTicketCountService();
			responseData = genderCountservice.execute(request, response);
		}
		else if(command.equals("/MovieDetailAgeGraph.mo")) {
			getAgeTicketCountService ageCountservice = new getAgeTicketCountService();
			responseData = ageCountservice.execute(request, response);
		}
		else if(command.equals("/MovieDetailReview.mo")) {
			MovieDetailReviewService detailReview = new MovieDetailReviewService();
			responseData = detailReview.execute(request, response);
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(responseData));
		out.flush();
	}
	
}