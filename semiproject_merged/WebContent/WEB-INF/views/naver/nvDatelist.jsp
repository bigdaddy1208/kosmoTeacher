<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page trimDirectiveWhitespaces="true"%>
<p>�� ${map.TOT}�� �������� 
<c:choose>
	<c:when test="${map.DFWEEK =='�Ͽ���'}">
	  <c:set var="col" value="red"/>
	</c:when>
	<c:when test="${map.DFWEEK =='�����'}">
	  <c:set var="col" value="blue"/>
	</c:when>
	<c:otherwise>
	  <c:set var="col" value="orange"/>
	</c:otherwise>
</c:choose>

<span style="color:${col}">${map.DFWEEK}</span>, ${map.YEAR}�� ${map.MON}�� ${map.DAY}�� ���ҽ��ϴ�</p>