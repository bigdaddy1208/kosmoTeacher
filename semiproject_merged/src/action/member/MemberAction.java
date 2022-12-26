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

//GET => pro.kosmo?cmd=member&scmd=mform => form만 view로 띄우기 위해서
//POST => 
/*
 *  <form method="post" action="pro.kosmo"  id="upform">
	<input type="hidden" name="cmd" value="member">
	<input type="hidden" name="scmd" value="minsert">
 * */
public class MemberAction implements Action {

	// Page처리를 위한 속성
	private int nowPage = 1; // 현재 페이지 값 -> 메뉴페이지와 연동되는 변수
	private int nowBlock = 1; // 현재 블럭 -> [][][][][] -> 1block
	private int totalRecord; // 총 게시물 수 .Dao로 부터 받음
	private int numPerPage = 10; // 한 페이지당 보여질 게시물 수
	private int pagePerBlock = 5; // 한 블럭당 보여질 페이지 수
	private int totalPage; // 전체 페이지 수 => totalRecord/numPerPage
	private int totalBlock; // 전체 블럭 수
	private int beginPerPage; // 각 페이지별 시작 게시물의 index값
	private int endPerPage; // 각 페이지별 마지막 게시물의 index값

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		ActionForward af = null;
		String subcmd = request.getParameter("scmd");
		if (subcmd.equals("mform")) {
			// URL에 경로를 감추기 위해서!
			af = new ActionForward("mymem/myMemberForm.jsp", false);
		} else if (subcmd.equals("minsert")) { // 입력처리
			MymemberDTO v = new MymemberDTO();
			
			v.setPid(request.getParameter("pid"));
			v.setPpwd(request.getParameter("ppwd"));
			v.setPname(request.getParameter("pname"));
			v.setPpernum(request.getParameter("ppernum"));
			v.setPaddr(request.getParameter("paddr"));
			v.setPtel(request.getParameter("ptel"));
			
			MyMemberDao.getDao().addMember(v);
			// index 이동
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

			// Map을 사용해서 검색의 값을 저장 한 후 mapper로 전달 할 수 있다.
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
			// 총 게시물 수 가져오기 => 실행결과 TotalRecord :21
			totalRecord = MyMemberDao.getDao().getCnt();
			System.out.println("1. TotalRecord :" + totalRecord);
			// 전체 페이지 출력해보기 => totalPage :2.1
			// double totalPage2 = totalRecord/(double)numPerPage;

			// 올림 => 2.1 => 3
			totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
			System.out.println("2. totalPage :" + totalPage);

			// totalBlock = totalPage/5;
			totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
			System.out.println("3. totalBlock :" + totalBlock);

			// 현재 페이지를 요청할 때 파라미터로 현재 페이지값을 받는다. 1 ~~~~~~~ n
			String s_page = request.getParameter("cPage");
			if (s_page != null) {
				nowPage = Integer.parseInt(s_page);
			}
			System.out.println("4. nowPage :" + nowPage);
			
			// nowPage의 값에서 SQL문의 #{begin} , #{end} 연산
			beginPerPage = (nowPage - 1) * numPerPage + 1;
			endPerPage = (beginPerPage-1) + numPerPage;
			System.out.println("5. beginPerPage = "+beginPerPage);
			System.out.println("5. endPerPage = "+endPerPage);
			// 데이터 전송해보기
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("begin", beginPerPage);
			map.put("end", endPerPage);

			List<MymemberDTO> list = MyMemberDao.getDao().getList(map);
			
			// 페이지 블록안에 페이지 반복 시키기 위한 startPage , endPage를 구해서 
			// view로 전달해야 함.
			int startPage = (int)((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
			int endPage = startPage + pagePerBlock - 1;
			// endPage의 연산의 범위가 우리가 구한 totalPage값 미만이라면 
			// totalPage의 값으로 대입시킨다.
			if (endPage > totalPage) {
				endPage = totalPage;
			}
			
			System.out.println("6. startPage = "+ startPage);
			System.out.println("6. endPage = "+ endPage);			
			
			//View에 forward로 전송할 데이터 
			request.setAttribute("list", list);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pagePerBlock", pagePerBlock); // 설정된 5
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
			// 데이터 전송해보기
			//Map<String, Integer> map = new HashMap<String, Integer>();
			//map.put("begin", beginPerPage);
			//map.put("end", endPerPage);
			pvo.setBegin(beginPerPage);
			pvo.setEnd(endPerPage);
			List<MymemberDTO> list = MyMemberDao.getDao().getSearchList(pvo);
			
			// 페이지 블록안에 페이지 반복 시키기 위한 startPage , endPage를 구해서 
			// view로 전달해야 함.
			int startPage = (int)((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
			int endPage = startPage + pagePerBlock - 1;
			// endPage의 연산의 범위가 우리가 구한 totalPage값 미만이라면 
			// totalPage의 값으로 대입시킨다.
			if (endPage > totalPage) {
				endPage = totalPage;
			}
			//View에 forward로 전송할 데이터 
			request.setAttribute("list", list);
			request.setAttribute("searchType", searchType);
			request.setAttribute("searchValue", searchValue);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pagePerBlock", pagePerBlock); // 설정된 5
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
				System.out.println("정상적인 접속이 아닙니다.=>" + request.getRemoteAddr());
				// 로그인 하지 않고 접속했다면 오류페이지나, 아니면 인덱스로 리다이렉트
				af = new ActionForward("pro.kosmo?cmd=index", true);
			}

		}
		return af;
	}

}
