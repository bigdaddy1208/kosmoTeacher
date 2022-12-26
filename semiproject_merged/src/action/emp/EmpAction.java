package action.emp;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import controller.ActionForward;
import dao.EmpDao;
import dto.EmpVO;

public class EmpAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		
		
		String searchValue = request.getParameter("searchValue");
		String searchType = request.getParameter("searchType");
		
		System.out.println("searchType =>"+searchType);
		System.out.println("searchValue =>"+searchValue);
		
		//Map을 사용해서 검색의 값을 저장 한 후 mapper로 전달 할 수 있다.
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		
		List<EmpVO> e = EmpDao.getDao().empList(map);
		request.setAttribute("list", e);
		return new ActionForward("emp/emplist.jsp",false);
	}

}
