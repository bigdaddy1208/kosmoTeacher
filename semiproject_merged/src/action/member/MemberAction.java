package action.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import controller.ActionForward;
import dao.MyMemberDao;
import dto.MymemberDTO;
import dto.PageSearchDTO;

//GET => pro.kosmo?cmd=member&scmd=mform => form�� view�� ���� ���ؼ�
//POST => 
/*
 *  <form method="post" action="pro.kosmo"  id="upform">
	<input type="hidden" name="cmd" value="member">
	<input type="hidden" name="scmd" value="minsert">
 * */
public class MemberAction implements Action {

	// Pageó���� ���� �Ӽ�
	private int nowPage = 1; // ���� ������ �� -> �޴��������� �����Ǵ� ����
	private int nowBlock = 1; // ���� �� -> [][][][][] -> 1block
	private int totalRecord; // �� �Խù� �� .Dao�� ���� ����
	private int numPerPage = 10; // �� �������� ������ �Խù� ��
	private int pagePerBlock = 5; // �� ���� ������ ������ ��
	private int totalPage; // ��ü ������ �� => totalRecord/numPerPage
	private int totalBlock; // ��ü �� ��
	private int beginPerPage; // �� �������� ���� �Խù��� index��
	private int endPerPage; // �� �������� ������ �Խù��� index��

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		ActionForward af = null;
		String subcmd = request.getParameter("scmd");
		if (subcmd.equals("mform")) {
			// URL�� ��θ� ���߱� ���ؼ�!
			af = new ActionForward("mymem/myMemberForm.jsp", false);
		} else if (subcmd.equals("minsert")) { // �Է�ó��
			MymemberDTO v = new MymemberDTO();
			
			v.setPid(request.getParameter("pid"));
			v.setPpwd(request.getParameter("ppwd"));
			v.setPname(request.getParameter("pname"));
			v.setPpernum(request.getParameter("ppernum"));
			v.setPaddr(request.getParameter("paddr"));
			v.setPtel(request.getParameter("ptel"));
			
			MyMemberDao.getDao().addMember(v);
			// index �̵�
			af = new ActionForward("pro.kosmo?cmd=index", true);
		} 
		else if(subcmd.equals("mmodify")){
			MymemberDTO v = new MymemberDTO();
			v.setPid(request.getParameter("pid"));
			v.setPpwd(request.getParameter("ppwd"));
			v.setPaddr(request.getParameter("paddr"));
			v.setPtel(request.getParameter("ptel"));
			MyMemberDao.getDao().modifymember(v);

			af = new ActionForward("pro.kosmo?cmd=index", false);
			
		}
		
		
		
		else if (subcmd.equals("mlist")) {
			// --------Search parameter
			String searchValue = request.getParameter("searchValue");
			String searchType = request.getParameter("searchType");

			System.out.println("searchType =>" + searchType);
			System.out.println("searchValue =>" + searchValue);

			// Map�� ����ؼ� �˻��� ���� ���� �� �� mapper�� ���� �� �� �ִ�.
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchType", searchType);
			map.put("searchValue", searchValue);
			// --------Search parameter
			List<MymemberDTO> list = MyMemberDao.getDao().listMember(map);
			request.setAttribute("list", list);
			af = new ActionForward("mymem/myMemberList.jsp", false);
			
		}
		
		else if (subcmd.equals("mPagelist")) {
			System.out.println("********************************");
			// �� �Խù� �� �������� => ������ TotalRecord :21
			totalRecord = MyMemberDao.getDao().getCnt();
			System.out.println("1. TotalRecord :" + totalRecord);
			// ��ü ������ ����غ��� => totalPage :2.1
			// double totalPage2 = totalRecord/(double)numPerPage;

			// �ø� => 2.1 => 3
			totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
			System.out.println("2. totalPage :" + totalPage);

			// totalBlock = totalPage/5;
			totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
			System.out.println("3. totalBlock :" + totalBlock);

			// ���� �������� ��û�� �� �Ķ���ͷ� ���� ���������� �޴´�. 1 ~~~~~~~ n
			String s_page = request.getParameter("cPage");
			if (s_page != null) {
				nowPage = Integer.parseInt(s_page);
			}
			System.out.println("4. nowPage :" + nowPage);
			
			// nowPage�� ������ SQL���� #{begin} , #{end} ����
			beginPerPage = (nowPage - 1) * numPerPage + 1;
			endPerPage = (beginPerPage-1) + numPerPage;
			System.out.println("5. beginPerPage = "+beginPerPage);
			System.out.println("5. endPerPage = "+endPerPage);
			// ������ �����غ���
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("begin", beginPerPage);
			map.put("end", endPerPage);

			List<MymemberDTO> list = MyMemberDao.getDao().getList(map);
			
			// ������ ��Ͼȿ� ������ �ݺ� ��Ű�� ���� startPage , endPage�� ���ؼ� 
			// view�� �����ؾ� ��.
			int startPage = (int)((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
			int endPage = startPage + pagePerBlock - 1;
			// endPage�� ������ ������ �츮�� ���� totalPage�� �̸��̶�� 
			// totalPage�� ������ ���Խ�Ų��.
			if (endPage > totalPage) {
				endPage = totalPage;
			}
			
			System.out.println("6. startPage = "+ startPage);
			System.out.println("6. endPage = "+ endPage);			
			
			//View�� forward�� ������ ������ 
			request.setAttribute("list", list);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pagePerBlock", pagePerBlock); // ������ 5
			request.setAttribute("totalPage",totalPage);
			
			
			af = new ActionForward("mymem/myMemberList2.jsp", false);
		} else if (subcmd.equals("mPagelist2")) {
			// --------Search parameter
			String searchValue = request.getParameter("searchValue");
			String searchType = request.getParameter("searchType");
			PageSearchDTO pvo = new PageSearchDTO();
			pvo.setSearchType(searchType);
			pvo.setSearchValue(searchValue);
			totalRecord = MyMemberDao.getDao().getCnt(pvo);
			totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
			totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
			String s_page = request.getParameter("cPage");
			if (s_page != null) {
				nowPage = Integer.parseInt(s_page);
			}
			beginPerPage = (nowPage - 1) * numPerPage + 1;
			endPerPage = (beginPerPage-1) + numPerPage;
			// ������ �����غ���
			//Map<String, Integer> map = new HashMap<String, Integer>();
			//map.put("begin", beginPerPage);
			//map.put("end", endPerPage);
			pvo.setBegin(beginPerPage);
			pvo.setEnd(endPerPage);
			List<MymemberDTO> list = MyMemberDao.getDao().getSearchList(pvo);
			
			// ������ ��Ͼȿ� ������ �ݺ� ��Ű�� ���� startPage , endPage�� ���ؼ� 
			// view�� �����ؾ� ��.
			int startPage = (int)((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
			int endPage = startPage + pagePerBlock - 1;
			// endPage�� ������ ������ �츮�� ���� totalPage�� �̸��̶�� 
			// totalPage�� ������ ���Խ�Ų��.
			if (endPage > totalPage) {
				endPage = totalPage;
			}
			//View�� forward�� ������ ������ 
			request.setAttribute("list", list);
			request.setAttribute("searchType", searchType);
			request.setAttribute("searchValue", searchValue);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pagePerBlock", pagePerBlock); // ������ 5
			request.setAttribute("totalPage",totalPage);
			af = new ActionForward("mymem/myMemberList3.jsp", false);	
		
		}else if (subcmd.equals("idchk")) {
			String id = request.getParameter("id");
			int cnt = MyMemberDao.getDao().idCheck(id);
			request.setAttribute("cnt", cnt);
			af = new ActionForward("mymem/idchk.jsp", false);
		} else if (subcmd.equals("mypage")) {
			HttpSession session = request.getSession(false);
			String pid = (String) session.getAttribute("pid");
			if (pid != null) {
				System.out.println("pid =>" + pid);

				MymemberDTO v = MyMemberDao.getDao().myPage(pid);
				request.setAttribute("v", v);

				af = new ActionForward("mymem/myPage.jsp", false);
			} else {
				System.out.println("�������� ������ �ƴմϴ�.=>" + request.getRemoteAddr());
				// �α��� ���� �ʰ� �����ߴٸ� ������������, �ƴϸ� �ε����� �����̷�Ʈ
				af = new ActionForward("pro.kosmo?cmd=index", true);
			}

		}
		return af;
	}

}
