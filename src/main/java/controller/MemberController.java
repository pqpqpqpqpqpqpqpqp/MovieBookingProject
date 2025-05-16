package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.vo.MemberVO;

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPocess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPocess(request, response);
	}

	
	protected void doPocess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		String path = request.getContextPath();
		String command = url.substring(path.length());
		
		System.out.println("web이동: "+command);
		
		Gson gson = new Gson();
		
		String result = null;
		if(command.equals("/test.api")) {
			MemberVO memberVO = new MemberVO();
			memberVO.setUserId(request.getAttribute());
			
			
			result = gson.toJson(user);
		}else if(command.equals("/main.api")) {
			MainRes res = new MainRes();
			res.setName("슈퍼맨");
			res.setNum(123);
			
			ResponseData responseData = new ResponseData();
			responseData.setData(res);
			result = gson.toJson(responseData);
			
		}
		
//		ResponseData responseData = new ResponseData();
//		try {
//			responseData.setData(200);
//			result = gson.toJson(responseData);
//		}catch (Exception e) {
//			responseData.setData(500);
//			result = gson.toJson("서비스를 이용할 수 없습니다.");
//		}
		
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
	}
}
