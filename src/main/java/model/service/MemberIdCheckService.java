package model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MemberDAO;
import model.vo.MemberVO;
import util.ResponseData;

public class MemberIdCheckService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {

		String userId = request.getParameter("userId");

		// DB 연결 구간
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.idCheck(userId);

		ResponseData data = null;

		System.out.println(result);
		if (result == 0) {
			data = new ResponseData();
		} else if (result == 1) {
			data = new ResponseData(300, "중복");
		} else if (result == -1) {
			data = new ResponseData(500, "서버 에러");
		}
		return data;

	}
}
