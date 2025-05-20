package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;
import member.vo.MemberVO;
import util.ResponseData;

public class MemberRegisterService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName  = request.getParameter("userName");
		String userNickname  = request.getParameter("userNickname");
		String userNum  = request.getParameter("userNum");
		String userTel  = request.getParameter("userTel");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUserId(userId);
		memberVO.setUserPw(userPw);
		memberVO.setUserName(userName);
		memberVO.setUserNickname(userNickname);
		memberVO.setUserNum(userNum);
		memberVO.setUserTel(userTel);
		
		
		// DB 연결 구간
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.regiset(memberVO);
		
		
		
		ResponseData data = null;
		System.out.println(result);
		if(result > 0) {
			data = new ResponseData();
		} else {
			data = new ResponseData(500, "서버 에러");
		}
		return data;
		
	}
}
