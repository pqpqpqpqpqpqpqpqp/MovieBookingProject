package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.UserDAO;
import member.vo.UserVO;
import util.ResponseData;

public class MemberLoginService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		/******
		 *  REQUEST 연결 구간
		 ******/
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("password");

		
		
		UserVO userVO = new UserVO();
		/******
		 *  DB 연결 구간
		 ******/
		UserDAO userDAO = new UserDAO();
		userVO = userDAO.login(userId);
		
		
		ResponseData data = null;
		if(userVO.getPassword().equals(userPassword)) {
			data = new ResponseData();
		} else {
			data = new ResponseData(500, "서버 에러");
		}
		return data;
		
	}
}
