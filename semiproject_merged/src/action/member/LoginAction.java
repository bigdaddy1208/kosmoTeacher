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
				//������ ��� ���ǿ� ���̵� �����Ѵ�.
				System.out.println("���� !!!!!!"+cnt);
				HttpSession session = request.getSession();
				session.setAttribute("pid", pid);
				af = new ActionForward("pro.kosmo?cmd=index", true);
			}else {//���� ����
				//������ ��� ���ǿ� ���̵� �����Ѵ�.
				
				System.out.println("���� ���� !!!!!!"+cnt);
				String msg ="����";
				request.setAttribute("emsg", msg);
				af = new ActionForward("login/loginError.jsp", false);
			}
			
		}else if(subcmd.equals("logout")) {
			//false�� ������ ������ �ǹ��Ѵ�.
			HttpSession session = request.getSession(false);
			// session.invalidate(); ��� ���� ����
			// logout�� ���� ������ ���ǿ��� id ���ǰ��� ���� �Ѵ�.
			session.removeAttribute("pid");
			af = new ActionForward("pro.kosmo?cmd=index", true);
		}
		return af;
	}

}
