package action.myboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import controller.ActionForward;
import dao.MyBoardDao;
import dto.MyBoardCommDTO;
import dto.MyBoardDTO;

public class MyBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ActionForward af = null;
		String subcmd = request.getParameter("scmd");
		if(subcmd.equals("bform")) {
			af = new ActionForward("myboard/myBoardForm.jsp", false);
		}else if(subcmd.equals("binsert")) {
			MyBoardDTO v = new MyBoardDTO();
			v.setWriter(request.getParameter("writer"));
			v.setSubject(request.getParameter("subject"));
			v.setContent(request.getParameter("content"));
			v.setReip(request.getRemoteAddr());
			

			MyBoardDao.getDao().addBoard(v);
			//af = new ActionForward("pro.kosmo?cmd=index", true);			
			af = new ActionForward("pro.kosmo?cmd=myboard&scmd=blist", true);			
		}else if(subcmd.equals("blist")) {
			List<MyBoardDTO> list = MyBoardDao.getDao().listBoard();
			request.setAttribute("list", list);
			af = new ActionForward("myboard/myBoardList.jsp", false);						
		}else if(subcmd.equals("bdetail")) {
			int no = Integer.parseInt(request.getParameter("no"));
			//�Խù��󼼺���
			MyBoardDTO vo = MyBoardDao.getDao().detailBoard(no);
			//�󼼺��⸦ ���� vo�� ����
			request.setAttribute("vo", vo);
			//��۸���Ʈ
			List<MyBoardCommDTO> listcomm = MyBoardDao.getDao().listCommBoard(no);
			//��� ����Ʈ�� ���� list����
			request.setAttribute("listcomm", listcomm);
			af = new ActionForward("myboard/myBoardDetail.jsp", false);	
			
		}else if(subcmd.equals("bdelete")) {
			int no = Integer.parseInt(request.getParameter("no"));
			MyBoardDao.getDao().deleteBoard(no);
			System.out.println("���� �׼� �۵�?");
			af = new ActionForward("pro.kosmo?cmd=myboard&scmd=blist", false);
		}
		else if(subcmd.equals("bcominsert")) {
			int mcode= Integer.parseInt(request.getParameter("mcode"));
			MyBoardCommDTO vo = new MyBoardCommDTO();
			vo.setMcode(mcode);
			vo.setMwriter(request.getParameter("mwriter"));
			vo.setMcontent(request.getParameter("mcontent"));
			vo.setReip(request.getRemoteAddr());
			MyBoardDao.getDao().addBoardComm(vo);
			af= new ActionForward("pro.kosmo?cmd=myboard&scmd=bdetail&no="+mcode,true);
		}
		return af;
	}

}
