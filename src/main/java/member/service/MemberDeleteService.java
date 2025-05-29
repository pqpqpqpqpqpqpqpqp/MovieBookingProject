package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;
import member.vo.MemberVO;
import util.ResponseData;

public class MemberDeleteService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		int userIdx  = Integer.parseInt(request.getParameter("userIdx"));
		
		
		
		
		// DB 연결 구간
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.delete(userIdx);
		
		
		
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
