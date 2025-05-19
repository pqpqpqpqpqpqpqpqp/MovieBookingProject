package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String forward = null;
		if (command.equals("/userLogin.me")) {
			forward = "/view/member/userLogin.jsp";
		} else if(command.equals("/userRegister.me")) {
			forward = "/view/member/userRegister.jsp";
		} else if(command.equals("/main.me")) {
			forward = "/view/main.jsp";
		} else if(command.equals("/logout.me")) {
			HttpSession session = request.getSession();
			session.invalidate();
			forward = "/view/main.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
		dispatcher.forward(request, response);
		
	}
}
