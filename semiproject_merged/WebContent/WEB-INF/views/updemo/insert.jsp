<%@page import="dao.UpBoardDao"%>
<%@page import="dto.UpBoardDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
//<순서>
//파일 업로드를 처리할 영역 
//파라미터 받기
//DTO에 저장
//Dao로 메서드의 인자로  DTO의 값을 전달
//리스트로 이동
	request.setCharacterEncoding("euc-kr");
	//* 업로드가 될 경로는 서버측에서 인식(서버측 절대경로)
	String save_div = application.getRealPath("resources/upload");

	//cos.jar에서 MultipartRequest 객체를 사용해서 
	//enctype="multipart/form-data" 타입의 데이터를 처리함
	MultipartRequest multi = null;
    // 설명) request, save디렉토리,업로드용량, 인코딩,파일 이름 변경을 위한 정책 클래스 
    // 파일업로드를  했을경우 현재 MultpartRequest객체가 업로드를 해당디렉토리에
    // 실행해준다.
    multi = new MultipartRequest(request,save_div,5 * 1024 * 1024,"euc-kr",
    		new DefaultFileRenamePolicy());
    String sub = multi.getParameter("sub");
    //파일 파라미터로 받기
    File fn = multi.getFile("upfile");
    System.out.println("file?=>"+fn.isFile());
    System.out.println("path?=>"+fn.getAbsolutePath());
    System.out.println("len =>"+fn.length());
    System.out.println(fn.exists());
    String fname = fn.getName();
    System.out.println("FileName :"+fname);
    
    //DTO생성후 저장
    UpBoardDTO vo = new UpBoardDTO();
    vo.setSub(sub);
    vo.setWriter(multi.getParameter("writer"));
    vo.setPwd(multi.getParameter("pwd"));
    vo.setCont(multi.getParameter("cont"));
    vo.setImgn(fname); // 이미지의 이름을 저장한다.
    
    //Dao로 전달
    UpBoardDao.getDao().addUpBoard(vo);
    response.sendRedirect("ex1_upboardList.jsp");
%>
<%-- 테스트 --%>
<%
	//String rPath = request.getSession().getServletContext().getRealPath("resources/upload");
	String rPath = application.getRealPath("resources/upload");
%><%=sub%><br>
<%=rPath%>




