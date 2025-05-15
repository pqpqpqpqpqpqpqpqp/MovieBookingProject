package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action.ViewMainHomeAction;

public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPocess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPocess(request, response);
	}

	
	protected void doPocess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String url = request.getRequestURI();
		System.out.println(url);
		
		Action action = null;
		ActionForward forward = null;
		
		System.out.println("viewHome");
		
		if(url.endsWith("mainHome.vo")) {
			action = new ViewMainHomeAction();
			forward = new ActionForward();
			forward.setPath("mainHome.jsp");
			forward.setRedirect(false);
		}
		

		try {
			if (action != null) {
				forward = action.execute(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}
	}
}

