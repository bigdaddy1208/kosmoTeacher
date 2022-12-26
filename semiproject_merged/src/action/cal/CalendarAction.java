package action.cal;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import controller.ActionForward;
import dto.CalendarDTO;

public class CalendarAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int yearParam = Integer.parseInt(request.getParameter("yparam"));
		int monParam = Integer.parseInt(request.getParameter("mparam"));

		Calendar targetDay = Calendar.getInstance(); // 오늘날짜
		targetDay.set(Calendar.YEAR, yearParam);
		targetDay.set(Calendar.MONTH, monParam); // 2월
		targetDay.set(Calendar.DATE, 1); // 타겟날짜를 오늘에서 1일로 변경
		int beginBlank = targetDay.get(Calendar.DAY_OF_WEEK) - 1;
		System.out.println(beginBlank + " <--preBlank");
		// Calendar API에 마지막날짜값을 리턴하는 메서드
		int lastDate = targetDay.getActualMaximum(Calendar.DATE);
		System.out.println(lastDate + " <--lastDate");

		int endBlank = 0;
		if ((beginBlank + lastDate) % 7 != 0) {
			endBlank = 7 - (beginBlank + lastDate) % 7;
		}
		int totalTd = beginBlank + lastDate + endBlank;

		Calendar mytoday = Calendar.getInstance(); // 오늘날짜
		
		CalendarDTO vo = new CalendarDTO();
		vo.setBeginBlank(beginBlank);
		vo.setEndBlank(endBlank);
		vo.setLastDate(lastDate);
		vo.setTotalTd(totalTd);
		vo.setYear(String.valueOf(targetDay.get(Calendar.YEAR)));
		vo.setMon(String.valueOf(targetDay.get(Calendar.MONTH)+1));
		vo.setDay(String.valueOf(String.valueOf(mytoday.get(Calendar.DATE))));
		request.setAttribute("vo", vo);
		

		return new ActionForward("cal/calendar.jsp", false);
	}

}
