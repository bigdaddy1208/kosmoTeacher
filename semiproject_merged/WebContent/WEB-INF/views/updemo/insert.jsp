<%@page import="dao.UpBoardDao"%>
<%@page import="dto.UpBoardDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
//<����>
//���� ���ε带 ó���� ���� 
//�Ķ���� �ޱ�
//DTO�� ����
//Dao�� �޼����� ���ڷ�  DTO�� ���� ����
//����Ʈ�� �̵�
	request.setCharacterEncoding("euc-kr");
	//* ���ε尡 �� ��δ� ���������� �ν�(������ ������)
	String save_div = application.getRealPath("resources/upload");

	//cos.jar���� MultipartRequest ��ü�� ����ؼ� 
	//enctype="multipart/form-data" Ÿ���� �����͸� ó����
	MultipartRequest multi = null;
    // ����) request, save���丮,���ε�뷮, ���ڵ�,���� �̸� ������ ���� ��å Ŭ���� 
    // ���Ͼ��ε带  ������� ���� MultpartRequest��ü�� ���ε带 �ش���丮��
    // �������ش�.
    multi = new MultipartRequest(request,save_div,5 * 1024 * 1024,"euc-kr",
    		new DefaultFileRenamePolicy());
    String sub = multi.getParameter("sub");
    //���� �Ķ���ͷ� �ޱ�
    File fn = multi.getFile("upfile");
    System.out.println("file?=>"+fn.isFile());
    System.out.println("path?=>"+fn.getAbsolutePath());
    System.out.println("len =>"+fn.length());
    System.out.println(fn.exists());
    String fname = fn.getName();
    System.out.println("FileName :"+fname);
    
    //DTO������ ����
    UpBoardDTO vo = new UpBoardDTO();
    vo.setSub(sub);
    vo.setWriter(multi.getParameter("writer"));
    vo.setPwd(multi.getParameter("pwd"));
    vo.setCont(multi.getParameter("cont"));
    vo.setImgn(fname); // �̹����� �̸��� �����Ѵ�.
    
    //Dao�� ����
    UpBoardDao.getDao().addUpBoard(vo);
    response.sendRedirect("ex1_upboardList.jsp");
%>
<%-- �׽�Ʈ --%>
<%
	//String rPath = request.getSession().getServletContext().getRealPath("resources/upload");
	String rPath = application.getRealPath("resources/upload");
%><%=sub%><br>
<%=rPath%>




