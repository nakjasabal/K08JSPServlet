<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파일이 저장될 디렉토리의 물리적경로(절대경로)를 얻어온다. 
String saveDirectory = application.getRealPath("/Uploads"); 
//업로드 할 파일의 최대용량 설정(만약 파일이 2개라면 둘을 합친 용량으로 설정해야한다.)
int maxPostSize = 1024 * 1000; 
//인코딩 방식을 설정한다. 
String encoding = "UTF-8";
/*
파일명이 중복될 경우 파일명을 자동으로 인덱싱 해주는 기능을 제공한다. 
"바다.jpg"가 이미 존재한다면 "바다1.jpg"로 파일명을 변경하여 업로드 한다. 
*/
FileRenamePolicy policy = new DefaultFileRenamePolicy();

try {
	/*
	앞에서 준비한 인수를 매개변수로 전달하여 Multipart객체를 생성한다. 
	해당 객체가 정상적으로 생성되면 파일업로드는 완료된다. 
	만약 예외가 발생한다면 주로 최대용량 혹은 물리적경로명을 잘못 지정한 경우가
	대부분이다. 
	*/
    MultipartRequest mr = new MultipartRequest(request, saveDirectory,
    		maxPostSize, encoding, policy);
	/*
	위 객체 생성만으로 파일명이 중복되는 부분까지 모두 처리할수 있다. 
	하지만 파일명이 한글인 경우 서버에서 인코딩 처리 등의 문제로 깨짐현상이 발생할수
	있으므로 파일명은 영문과 숫자의 조합으로 사용하는것이 좋다. 
	*/
}
catch(Exception e){
	e.printStackTrace();
}
%>