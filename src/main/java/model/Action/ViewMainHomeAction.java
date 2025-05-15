package model.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import controller.ActionForward;
import model.dao.MemberDAO;
import model.vo.MemberVO;

public class ViewMainHomeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberVO memberVO = new MemberVO();

		MemberDAO dao = new MemberDAO();
		memberVO = dao.login(request.getParameter("userId"));

		ActionForward forward = new ActionForward();
		if (memberVO.getUserId().equals(request.getParameter("userPw"))) {

			HttpSession session = request.getSession();
			session.setAttribute("userId", memberVO.getUserId());
			session.setAttribute("userNickname", memberVO.getUserNickname());

			forward.setPath(request.getContextPath()+"/mainHome.bo");
			forward.setRedirect(true);
		} else {
			forward.setPath("mainHome.jsp");
			forward.setRedirect(true);			
		}

		return forward;
		
		
	}

}
