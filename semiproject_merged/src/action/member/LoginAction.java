package action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import controller.ActionForward;
import dao.LoginDao;
import dto.MymemberDTO;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward af = null;
		String subcmd = request.getParameter("scmd");
		if(subcmd.equals("form")) {
			af = new ActionForward("login/myLoginForm.jsp", false);
		}else if(subcmd.equals("login")) {
			String pid = request.getParameter("pid");
			String ppwd = request.getParameter("ppwd");
			MymemberDTO dto = new MymemberDTO();
			dto.setPid(pid);
			dto.setPpwd(ppwd);
			int cnt = LoginDao.getDao().login(dto);
			System.out.println("Cnt=>"+cnt);
			if(cnt > 0) {
				//인증일 경우 세션에 아이디를 저장한다.
				System.out.println("인증 !!!!!!"+cnt);
				HttpSession session = request.getSession();
				session.setAttribute("pid", pid);
				af = new ActionForward("pro.kosmo?cmd=index", true);
			}else {//인증 실패
				//인증일 경우 세션에 아이디를 저장한다.
				
				System.out.println("인증 실패 !!!!!!"+cnt);
				String msg ="에러";
				request.setAttribute("emsg", msg);
				af = new ActionForward("login/loginError.jsp", false);
			}
			
		}else if(subcmd.equals("logout")) {
			//false는 기존의 세션을 의미한다.
			HttpSession session = request.getSession(false);
			// session.invalidate(); 모든 세션 삭제
			// logout일 경우는 기존의 세션에서 id 세션값만 삭제 한다.
			session.removeAttribute("pid");
			af = new ActionForward("pro.kosmo?cmd=index", true);
		}
		return af;
	}

}
