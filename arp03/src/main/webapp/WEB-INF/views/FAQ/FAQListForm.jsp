<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

ul,li{

display:inline;

}

</style>
<body>
	<jsp:include page ="../include/header.jsp"/>

<h2 align="center">FAQ 입니다</h2>

<c:if test="${ mem.id eq 'admin' }">
	<button onclick="location.href='finsertForm.ad';">작성하기</button>
</c:if>
<nav align="center">
<ul >
	<li><a href="flist.ad">전체</a></li>
	<li><a href="fcategory.ad?category=로그인">로그인</a></li>
	<li><a href="fcategory.ad?category=수강">수강</a></li>
	<li><a href="fcategory.ad?category=홈페이지">홈페이지</a></li>
	<li><a href="fcategory.ad?category=기타">기타</a></li>
</ul>
</nav>
<br>
<table align="center" border="1" cellspacing="0" width="700" style="text-align:center;"> 
<tr>
	<th>구분</th>
	<th colspan="3" width="300">질문내용</th>
	
</tr>
<c:forEach items="${ list }" var="f">
	
	<tr>
		<td >${f.category }</td>
		<td colspan="3"  class="question" style="cursor:pointer">${ f.question }</td>
	</tr>
	<tr>
		<td colspan="3" style="display:none" style="cursor:pointer" class="answer" >
		${f.answer } 
		<c:if test="${ mem.id eq 'admin' }">
		<a href="fdelete.ad?faq_no=${ f.faq_no }" >삭제하기</a>
		</c:if>
		</td>
		
	</tr>
	
</c:forEach>

</table>


<script>

$(function(){
	
		$(".question").on("click" , function(){
			var this_answer=$(this).parent().next().children().eq(0);
			console.log($(this_answer).css("display"));
			
			if($(this_answer).css("display")=="table-cell"){
				
				$(".answer").hide()
			}else{
				$(".answer").hide()
				$(this_answer).show()
			}
			/* //다 접기
			var this_answer=$(this).parent().next().children().eq(0);
			$(".answer").each(function(index,item){
				if($(this)!=this_answer)alert("ddd")
			})
			this_answer.toggle() */
		});
	
		$(".answer").on("click" , function(){
			
			
		});
	
});


</script>
</body>
</html>