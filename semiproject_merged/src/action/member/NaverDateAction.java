package action.member;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import controller.ActionForward;
import dao.NaverDateDao;

public class NaverDateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		ActionForward af = null;
		String subcmd = request.getParameter("scmd");
		if(subcmd.equals("nform")) {
			return new ActionForward("naver/nvform.jsp", false);
		} else if(subcmd.equals("dday")) {
			String dday = request.getParameter("dday");
			String ddayRes =  NaverDateDao.getDao().dday(dday);
			request.setAttribute("ddayRes", ddayRes);
			return new ActionForward("naver/nvDatelist2.jsp", false);
		} else {
			
			System.out.println("Test==>");
			String today = request.getParameter("today");
			today = today.replace("-", "");
			Map<String, Object> list = NaverDateDao.getDao().getlist(today);
			
			request.setAttribute("map", list);
			
			return new ActionForward("naver/nvDatelist.jsp", false);	
		}
		

	}

}
