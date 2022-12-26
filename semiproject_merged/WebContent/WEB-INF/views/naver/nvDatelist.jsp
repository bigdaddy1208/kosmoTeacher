<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page trimDirectiveWhitespaces="true"%>
<p>총 ${map.TOT}일 남았으며 
<c:choose>
	<c:when test="${map.DFWEEK =='일요일'}">
	  <c:set var="col" value="red"/>
	</c:when>
	<c:when test="${map.DFWEEK =='토요일'}">
	  <c:set var="col" value="blue"/>
	</c:when>
	<c:otherwise>
	  <c:set var="col" value="orange"/>
	</c:otherwise>
</c:choose>

<span style="color:${col}">${map.DFWEEK}</span>, ${map.YEAR}년 ${map.MON}월 ${map.DAY}일 남았습니다</p>