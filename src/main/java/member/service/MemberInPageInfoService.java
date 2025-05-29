package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;
import member.vo.MemberVO;
import util.ResponseData;

public class MemberInPageInfoService {
    public ResponseData myInPageInfo(HttpServletRequest request, HttpServletResponse response) {
      
    	int userIdx = Integer.parseInt(request.getParameter("userIdx"));
        MemberDAO dao = new MemberDAO();
        MemberVO user = dao.getUserInfo(userIdx); // DB 조회

        if (user != null) {
            ResponseData data = new ResponseData(200, "성공");
            data.setData(user);
            return data;
        } else {
            return new ResponseData(404, "사용자 정보를 찾을 수 없습니다.");
        }
    }
}
