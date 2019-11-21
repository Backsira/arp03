<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<fmt:parseDate value="${s.enrolldate }" pattern="yyyy-MM-dd" var="e"/>
<fmt:formatDate value="${e }" pattern="yyyy-MM-dd" var = "d"/>
<form action="deletesurvey.ma">
	<input type="text" name="lec_no" value="${lec.lec_no}" readonly>
	<input type="text" name="m_no" value="${mem.name }" readonly>
	<input type="text" name="title" value="${s.title }"placeholder="제목" readonly>
	<input type="text" name="enrolldate" value="${d }" readonly>
	<input type="text" name="q1" value="${s.q1 }" readonly> 
	<input type="text" name="a1" value="${s.a2 }" readonly>
	<input type="text" name="q2" value="${s.q2 }" readonly>
	<input type="text" name="a2" value="${s.a2 }" readonly>
	<input type="text" name="q3" value="${s.q3 }" readonly>
	<input type="text" name="a3" value="${s.a3 }" readonly>
	<button type="submit">삭제</button>
	
</form>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>