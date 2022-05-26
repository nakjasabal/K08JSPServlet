<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<html>
<head><title>Session</title></head>
<body>
	<jsp:include page="../Common/Link.jsp" />
    <h2>로그인 페이지</h2>
    <!--  
    request영역에 해당 속성이 있는지 확인하여 속성이 있다면
    에러메세지를 출력한다. 
    해당 속성은 로그인 실패 처리시 request영역에 저장하게 된다. 
    -->
    <span style="color: red; font-size: 1.2em;"> 
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>
    </span>
    <%
    //로그인 확인
    if (session.getAttribute("UserId") == null) {
    	//만약 session영역에 저장된 속성이 없다면 로그인 이전의 상태이므로
    	//로그인 폼을 화면에 출력한다. 
    %>
    <script>
    //폼값의 유효성 검증을 위한 함수. 입력값이 빈값인지 확인한다. 
    function validateForm(form) {
        if (!form.user_id.value) {
            alert("아이디를 입력하세요.");
            form.user_id.focus();
            return false;
        }
        if (form.user_pw.value == "") {
            alert("패스워드를 입력하세요.");
            form.user_pw.focus();
            return false;
        }
    }
    </script>
    <!--  
    	폼값 체크를 위한 validateForm()함수 호출시 <form>태그의 DOM객체를
    	this를 통해 전달한다. 
    -->
    <form action="LoginProcess.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="password" name="user_pw" /><br />
        <input type="submit" value="로그인하기" />
    </form>
    <%
    } else { // 로그인된 상태
    %>
        <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
        <a href="Logout.jsp">[로그아웃]</a>
    <%
    }
    %>
</body>
</html>