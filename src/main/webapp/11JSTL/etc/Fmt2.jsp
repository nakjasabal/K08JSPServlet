<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<html>
<head><title>JSTL - fmt 2</title></head>
<body>
    <c:set var="today" value="<%= new java.util.Date() %>" />
    
    <!-- 
    날짜만 출력할때 사용한다. type="date"
    dateStyle속성에 따라 아래와 같이 표현된다.
	    full : 2022년 6월 3일 금요일
		short : 22. 6. 3.
		long : 2022년 6월 3일
		default : 2022. 6. 3.
     -->
    <h4>날짜 포맷</h4> 
    full : <fmt:formatDate value="${ today }" type="date" dateStyle="full"/> <br /> 
    short : <fmt:formatDate value="${ today }" type="date" dateStyle="short"/> <br />
    long : <fmt:formatDate value="${ today }" type="date" dateStyle="long"/> <br />
    default : <fmt:formatDate value="${ today }" type="date" dateStyle="default"/>

	<!--  
	시간만 출력할때 사용한다. type="time"
	timeStyle의 값에 따라 
		full : 오전 11시 30분 54초 대한민국 표준시
		short : 오전 11:30
		long : 오전 11시 30분 54초 KST
		default : 오전 11:30:54
	-->
    <h4>시간 포맷</h4> 
    full : <fmt:formatDate value="${ today }" type="time" timeStyle="full"/> <br /> 
    short : <fmt:formatDate value="${ today }" type="time" timeStyle="short"/> <br />
    long : <fmt:formatDate value="${ today }" type="time" timeStyle="long"/> <br />
    default : <fmt:formatDate value="${ today }" type="time" timeStyle="default"/>
        
    <h4>날짜/시간 표시</h4>
    <!-- 날짜와 시간을 둘다 표시하므로 포맷도 각각 지정할 수 있다. 앞에서 사용한 
    속성값들을 조합해서 테스트해보자. -->    
    <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/> 
    <br />
    <!-- 출력할 포맷을 pattern으로 지정한다. -->
    <fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/> 
    
    
    <h4>타임존 설정</h4>
    <!-- GMT : 세계 표준시로 영국의 그리니치 천문대를 기준으로 한다. -->
    <fmt:timeZone value="GMT"> 
        <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/>
        <br />    
    </fmt:timeZone>
    <!-- 타임존을 미중부로 설정 -->
    <fmt:timeZone value="America/Chicago">
        <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/>
    </fmt:timeZone>
    <!-- 표준시에 9를 더하면 KST(대한민국표준시)가 된다. -->
    <fmt:timeZone value="GMT+9"> 
        <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/>
        <br />    
    </fmt:timeZone>
    
    
    
    <h4>timezone에 사용할 수 있는 문자열 구하기</h4>
    <c:forEach var="ids" items="<%=java.util.TimeZone.getAvailableIDs() %>">
    	${ids } <br>
    </c:forEach>
    
</body>
</html>


