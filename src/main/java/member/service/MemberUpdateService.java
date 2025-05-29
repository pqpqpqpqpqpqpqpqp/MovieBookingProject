package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;
import member.vo.MemberVO;
import util.ResponseData;

public class MemberUpdateService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		int userIdx  = Integer.parseInt(request.getParameter("userIdx"));
		String userName  = request.getParameter("userName");
		String userNickname  = request.getParameter("userNickname");
		String userTel  = request.getParameter("userTel");
		String userPw = request.getParameter("userPw");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUserIdx(userIdx);
		memberVO.setUserName(userName);
		memberVO.setUserNickname(userNickname);
		memberVO.setUserTel(userTel);
		memberVO.setUserPw(userPw);
		
		System.out.println(memberVO.getUserNickname());
		
		
		// DB 연결 구간
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.update(memberVO);
		
		
		
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
