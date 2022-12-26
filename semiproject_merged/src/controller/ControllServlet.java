package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;


@WebServlet("*.kosmo")
public class ControllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		String cmd = request.getParameter("cmd");
		Action action = null;
		if(cmd !=null) {
			ActionFactory factory = ActionFactory.getFactory();

			action = factory.getAction(cmd);
			ActionForward af = action.execute(request, response);
			if(af.isMethod()) { 
				response.sendRedirect(af.getUrl());
			}else {
				String path ="/WEB-INF/views/";
				RequestDispatcher rd = request.getRequestDispatcher(path+af.getUrl());
				rd.forward(request, response);
			}
		}else {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print("¿À·ù");
			out.close();
		}
	}
}






