package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberController extends HttpServlet {
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
		String url = request.getRequestURI();
		String path = request.getContextPath();
		String command = url.substring(path.length());
		String forward = null;
		if (command.equals("/userLogin.me")) {
			forward = "/view/member/userLogin.jsp";
		} else if (command.equals("/userRegister.me")) {
			forward = "/view/member/userRegister.jsp";
		} else if (command.equals("/main.me")) {
			forward = "/view/main.jsp";
		} else if (command.equals("/logout.me")) {
			HttpSession session = request.getSession();
			session.invalidate();
			forward = "/view/main.jsp";
		} else if (command.equals("/myPagemain.me")) {
			forward = "/view/member/myPagemain.jsp";
		} else if (command.equals("/myCgvHome.me")) {
			forward = "/view/member/userPage/myTabPage/myCgvHome.jsp";
		} else if (command.equals("/myTicket.me")) {
			forward = "/view/member/userPage/myTabPage/myTicket.jsp";
		} else if (command.equals("/userInfo.me")) {
			forward = "/view/member/userPage/myTabPage/userInfo.jsp";
		} else if (command.equals("/userSelectInfo.me")) {
			forward = "/view/member/userPage/myTabPage/userSelectInfo.jsp";
		} else if (command.equals("/userDelete.me")) {
			forward = "/view/member/userPage/myTabPage/userDelete.jsp";
		} else if (command.equals("/editName.me")) {
			forward = "/view/member/userPage/myTabPage/userInfoSubPage/editName.jsp";
		} else if (command.equals("/editPhone.me")) {
			forward = "/view/member/userPage/myTabPage/userInfoSubPage/editPhone.jsp";
		} else if (command.equals("/editPassword.me")) {
			forward = "/view/member/userPage/myTabPage/userInfoSubPage/editPassword.jsp";
		} else if (command.equals("/myCgvHome_movie.me")) {
			forward = "/view/member/userPage/myCgvPage/myCgvHomeInMain.jsp";
		} else if (command.equals("/myCgvHome_review.me")) {
			forward = "/view/member/userPage/myCgvPage/myCgvHomeInMain.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
		dispatcher.forward(request, response);

	}
}
