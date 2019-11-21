<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.btns{display: inline-block;}
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js" type="text/javascript"></script>
</head>
<body>
	
	<jsp:include page="../include/header.jsp"/>
	
	<h1 align="center">게시글 상세보기</h1>
	<br>
	
	<table align="center">
		<tr>
			<td colspan="2" align="center">${ b.b_no }번 글 상세보기</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${ b.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${ b.content }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="">신고</button>
				<c:if test="${ mem.m_no eq b.m_no }">
					<button type="button" onclick="location.href='bupdateView.do?b_no=${b.b_no}';">수정</button>
					<button type="button" onclick="deleteCheck();">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>
	
	<br>
	<br>
	
	<!-- 댓글 등록 부분 -->
	<table align="center" border="1" cellspacing="0">
		<tr>
			<td><textarea cols="55" rows="3" id="rContent"></textarea></td>
			<td><button id="rBtn">등록</button></td>
		</tr>
	</table>
	<!-- 댓글 목록 부분 -->
	<table align="center" width="600" border="1" cellspacing="0" id="rtb" class="paginated">
		<thead>
			<tr>
				<td colspan="4"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<script>
		function deleteCheck() {
			var rst = confirm("정말 삭제하시겠습니까?");
			if(rst) {
				location.href='bdelete.do?b_no=${b.b_no}';
			}
		}
	
		$(function(){
			getReplyList();
			
			jQuery("#rBtn").on("click", function(){
				// 내용, 작성자 아이디, 게시판 번호
				$.ajax({
					url:"rinsert.do",
					data:{content:$("#rContent").val(), b_no:${b.b_no}, m_no:${mem.m_no}},
					success:function(data){
						
						if(data == "success") {
							getReplyList();
							$("#rContent").val("");
						} else {
							alert("댓글 작성에 실패했습니당");
						}
						
					}, error:function(){
						console.log("ajax 통신 실패");
					}
				});
				
			});
			
			$clicked = 0;

			jQuery(document).on("click", ".rr", function(){
				//console.log($(this).parent().parent().children().eq(0).text());
				$parent_no = $(this).parent().parent().children("#hrno").val();
				
				//$(this).parent().parent().after("<tr><td colspan='3'><textarea cols='55' rows='3' id='reContent'></textarea></td><td><button class='rrsb'>등록</button>" + "<input type='button' class='cancel' value='취소'/></td></tr>");
				
				if($clicked%2 == 0) {
					$(this).parent().parent().after("<tr><td colspan='3'><textarea cols='55' rows='3' id='reContent'></textarea></td><td><button class='rrsb'>등록</button>" + "<input type='button' class='cancel' value='취소'/></td></tr>");
				} else {
					$(this).parent().parent().next().remove();
				}
				//console.log($clicked);
				$clicked++;
				//console.log($clicked);
			});
			
			jQuery(document).on("click", ".rrsb", function(){
				//console.log($("#reContent").val());
				//console.log($parent_no);
				
				$.ajax({
					url:"reinsert.do",
					data:{content:$("#reContent").val(), b_no:${b.b_no}, m_no:${mem.m_no}, parent_no:$parent_no},
					success:function(data){
						if(data == "success") {
							getReplyList();
						} else {
							alert("댓글 작성에 실패했습니당");
						}
					}, error:function(){
						console.log("ajax 통신 실패");
					}	
				
				});
			});
			
			jQuery(document).on("click", ".del", function(){
				//console.log($(this).parent().parent().children().eq(0).text());
				//var $r_no = $(this).parent().parent().children().eq(0).text();
				//console.log($td1.eq(0).text());
				var $r_no = $(this).parent().parent().children("#hrno").val();
							
				var rst = confirm("정말 삭제하시겠습니까?");
				if(rst) {
					$.ajax({
						url:"deleteReply.do",
						data:{r_no:$r_no},
						success:function(data){
							//console.log("삭제 성공");
							getReplyList();
						}, error:function(){
							console.log("ajax 통신 실패");
						}
					});
				}
			});
			
			jQuery(document).on("click", ".alt", function(){
				//console.log("수정ㄱㄱ");
				var $content = $(this).parent().parent().children().eq(1);
				var $btns = $(this).parent().parent().children().eq(3);
				
				var $reContent = $("<textarea cols='30' name='reContent' id='reContent'>" + $content.text() + "</textarea>");
				
				$content.replaceWith($reContent);
				$("#reContent").focus();
				
				var $reBtns = $('<input type="button" id="alert" value="등록"/>' + '<input type="button" class="cancel" value="취소"/>');
				
				/* $reBtns += $submit;
				$reBtns += $cancel; */
				
				$btns.replaceWith($reBtns);
				
			});
			
			jQuery(document).on("click", "#alert", function(){
				
				//var $r_no = $(this).parent().children().eq(0).text();
				/* console.log($r_no);
				console.log($("#reContent").val()); */
				var $r_no = $(this).parent().children("#hrno").val();
				
				jQuery.ajax({
					url:"updateReply.do",
					data:{content:$("#reContent").val(), r_no:$r_no},
					success:function(data){
						console.log("수정 성공");
						getReplyList();
					}, error:function(){
						console.log("ajax 통신 실패");
					}
				})
				
			});
			
			jQuery(document).on("click", ".cancel", function(){
				getReplyList();
			});
			
		
		});
		$count = 0;
		function getReplyList(currentPage){
			$clicked = 0;
			jQuery.ajax({
				url:"replyList.do",
				data:{b_no:${b.b_no}, currentPage:currentPage},
				dataType:"json",
				success:function(data){
					console.log(data.list);
					console.log(data.pi);
					$tbody = jQuery("#rtb tbody");
					$tbody.html("");
					$pageinfo = data.pi;
					//$("#rCount").text("댓글(" + data.length + ")");
					$rcount = 0;
					
					if(data.list.length > 0){ // 댓글이 존재할 경우
						jQuery.each(data.list, function(index, value) { // value == data[index]
						
						$tr = jQuery("<tr>");
						$td = jQuery("<td>");
						
						//$rnoTd = $("<td>").text(value.r_no);
						$rrnoTd = jQuery("<td>").text("ㄴ");
							
						$contentTd = jQuery("<td width='250'>").text(value.content);
						$dateTd = jQuery("<td>").text(value.update_date);
						
						$rreply = jQuery('<input type="button" class="rr" value="re"/>');
						$altB = jQuery('<input type="button" class="alt" value="alt"/>');
						$deleteB = jQuery('<input type="button" class="del" value="del"/>');
						$hrno = jQuery('<input type="hidden" id="hrno" value="' + value.r_no + '"/>');
						
						if(value.depth == 1) {
							$contentTd = jQuery("<td colspan='2' width='250'>").text(value.content);
						} else {
							$tr.append($rrnoTd);
						}
						
						if(value.status == 'N') {
							//$rnoTd = $("<td>").text("");
							$contentTd = jQuery("<td colspan='2'>").text("사용자가 삭제한 댓글입니다.");
							$dateTd = jQuery("<td>").text("");
							$rcount++;
						}
						
						$tr.append($contentTd);
						$tr.append($dateTd);
						//$tr.append($hrno);
						
						if(value.depth == 1 && value.status == 'Y') {
							$tr.append($td.append($rreply));
						}
						
						if(value.m_no == ${mem.m_no} && value.status == 'Y') {
							$tr.append($td.append($altB));
							$tr.append($td.append($deleteB));
						}
						
						$tr.append($hrno);
						$tbody.append($tr);
						
						});
					if($count == 0) {
						page(data.pi);
					} 
						$count++;
						console.log($count);
					} else {
						$tr = $("<tr>");
						
						$contentTd = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
						$tr.append($contentTd);
						
						$tbody.append($tr);
					}
					//console.log((data.length - $rcount));
					jQuery("#rCount").text("댓글(" + data.pi.listCount + ")");
					if($pageinfo.currentPage == 1) {
						$("#lt").attr("disabled", true);
					} else {
						$("#lt").attr("disabled", false);
					}
					if($pageinfo.currentPage == $pageinfo.maxPage) {
						$("#rt").attr("disabled", true);
					} else {
						$("#rt").attr("disabled", false);
					}
					
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		
		function page(e){ 
			//$("#rtb> :last").append("<tr><td colspan='4'>헤헤</td></tr>")
			var $lastRow = jQuery("#rtb:last");
			var $leftbtn = jQuery("<div class='leftbtn btns'>");
			var $ltlt = jQuery("<button id='ltlt'>").text("<<");
			var $lt = jQuery("<button id='lt'>").text("<");
			$leftbtn.append($ltlt).append($lt);
			$lastRow.append("<tr><td colspan='4'>");
			console.log($lastRow);
			$lastRow.append($leftbtn);
			var $rightbtn = jQuery("<div class='rightbtn btns'>");
			var $gt = jQuery("<button id='rt'>").text(">");
			var $gtgt = jQuery("<button id='rtrt'>").text(">>");
			$rightbtn.append($gt).append($gtgt);
			for (var i = e.startPage; i <= e.endPage; i++) {
					var btn = jQuery("<button class='btns numbtn'>").text(i);
					$lastRow.append(btn);
				}
				//$lastRow.append(btn);
			
			$lastRow.append($rightbtn);
			$lastRow.append("</td></tr>");
			//$(".tagactive").attr("disabled", true);
			
		}
		
		jQuery(document).on("click", "#rtrt", function(){
			getReplyList($pageinfo.endPage);
			//console.log($pageinfo.endPage);
		});
		
		jQuery(document).on("click", "#ltlt", function(){
			getReplyList(1);
		});
		
		jQuery(document).on("click", "#lt", function(){
			getReplyList(($pageinfo.currentPage) - 1);
		});
		
		jQuery(document).on("click", "#rt", function(){
			getReplyList(($pageinfo.currentPage) + 1);
		});
		
		jQuery(document).on("click", ".numbtn", function(){
			//console.log($(this).text());
			getReplyList($(this).text());
		});
		
	</script>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>