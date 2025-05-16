package model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.UserDAO;
import member.vo.UserVO;
import util.ResponseData;

public class MemberRegisterService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		
		/******
		 *  REQUEST 연결 구간
		 ******/
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		
		UserVO userVO = new UserVO();
		userVO.setUserId(userId);
		userVO.setPassword(userPassword);
		userVO.setNickname(nickname);
		
		
		/******
		 *  DB 연결 구간
		 ******/
		UserDAO userDAO = new UserDAO();
		int result = userDAO.regiset(userVO);
		
		
		
		ResponseData data = null;
		if(result > 0) {
			data = new ResponseData();
		} else {
			data = new ResponseData(500, "서버 에러");
		}
		return data;
		
	}
}
