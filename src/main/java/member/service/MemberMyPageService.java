package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDAO;
import member.vo.MemberVO;
import util.ResponseData;

public class MemberMyPageService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		int userIdx = Integer.parseInt(request.getParameter("userIdx"));
		MemberVO memberVO = new MemberVO();
		MemberDAO memberDAO = new MemberDAO();
		
		int result = 0;
		if(userIdx != 0) {
			memberVO = memberDAO.myPageLoad(userIdx);
			result = 1;
		}
		
		
		ResponseData data = null;

		if(result == 1) {
			data = new ResponseData(memberVO);
		} else{
			data = new ResponseData(500, "서버 에러");
		}
		return data;
		
	}
}

