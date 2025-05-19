package model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.MemberDAO;
import model.vo.MemberVO;
import util.ResponseData;

public class MemberLoginService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		String inputId = request.getParameter("userId");
		String inputPw = request.getParameter("userPw");
		
		MemberVO memberVO = new MemberVO();
		MemberDAO memberDAO = new MemberDAO();
		
		memberVO = memberDAO.login(inputId);
		int result = 0;
		if(memberVO != null && memberVO.getUserPw().equals(inputPw)) {
			HttpSession session = request.getSession();
			session.setAttribute("userIdx", memberVO.getUserIdx());
			result = 1;
		}else if(memberVO != null) {
			result = 2;
		}
		
		
		
		ResponseData data = null;

		if(result == 1) {
			data = new ResponseData();
		} else if(result == 2){
			data = new ResponseData(300, "로그인 실패");
		} else{
			data = new ResponseData(500, "서버 에러");
		}
		return data;
		
	}
}
