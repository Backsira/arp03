<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
<title>상세보기 페이지</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<title>Summernote Lite</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

<style>
	input, textarea{
		border:none;
	}
	#qOpen{
		display:none;
	}
/* 	.c1{
		border:1px solid black;
		width:623px;
		height:250px;
		margin-left:auto;
		margin-right:auto;
	} */
/* 	.t1{
		margin-top:50px;
	} */
/* 	.c5{
		border:1px solid black;
		width:800px;
		height:auto;
		margin-left:auto;
		margin-right:auto;
	} */
	
	.card{
		text-align:left;
		margin-left:auto;
		margin-right:auto;
		min-hieght:500px;
		height:auto;
	
	}
	
	#bor{
		margin:0px;	
	}
	
	#regDate{
	float:right;
	color :gray;
	font-size:13px;
	}
	
	
	#file,a{
	font-size:15px;
	}
	#btn{
		text-align:right;
		margin-left:auto;
		margin-right:auto;
		width:600px;
	}
	.btn-info{
		background:#1e88e5;
	}
</style>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../include/bsidebar.jsp" %>
        </aside>
        <!-- End of Left-sidebar -->

		<!-- Page wrapper  -->
		<div class="page-wrapper">

			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Bread crumb and right sidebar toggle -->
				<!-- ============================================================== -->
				<div class="row page-titles">
					<div class="col-md-5 col-12 align-self-center">
						<h3 class="text-themecolor mb-0 mt-0">Forms</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
							<li class="breadcrumb-item active">Form</li>
						</ol>
					</div>
					<div class="col-md-7 col-12 align-self-center d-none d-md-block">
						<div class="d-flex mt-2 justify-content-end">
							<div class="d-flex mr-3 ml-2">
								<div class="chart-text mr-2">
									<h6 class="mb-0">
										<small>THIS MONTH</small>
									</h6>
									<h4 class="mt-0 text-info">$58,356</h4>
								</div>
								<div class="spark-chart">
									<div id="monthchart"></div>
								</div>
							</div>
							<div class="d-flex mr-3 ml-2">
								<div class="chart-text mr-2">
									<h6 class="mb-0">
										<small>LAST MONTH</small>
									</h6>
									<h4 class="mt-0 text-primary">$48,356</h4>
								</div>
								<div class="spark-chart">
									<div id="lastmonthchart"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End Bread crumb and right sidebar toggle -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- Row -->
				<div class="row">
					<!-- 수강페이지 메뉴 -->
					<%@ include file="../include/blecturemenu.jsp"%>

					<div class="col-lg-10">
						<div class="card">
							<div class="card-body"
								style="padding-left: 40px; padding-right: 40px;">
								<section class="cd-horizontal-timeline loaded">

									<!-- .timeline -->
									<div class="events-content">
										<form class="c5" action="qupdateForm.qu?q_no=${ q.q_no }"
											method="post" enctype="multipart/form-data">
											<br>
											<h3 align="center" style="font-size: 20px; color: gray;">상세보기 페이지</h3>
											<br>
											<br>
											<div class="selected">
												<!-- <h3 style="font-size: 18px; font-weight:bold;"><img width="55" src="resources/siraFile/Q2.png">&nbsp;&nbsp;&nbsp;학생질문</h3> -->
												<br> <img width="60" src="resources/siraFile/Q2.png">&nbsp;&nbsp;&nbsp;<input
													style="font-weight: bold; font-size: 25px;" size="20"
													type="text" name="title" value="${ q.title }" readonly>
												<hr class="mt-4">
												<input size="10" type="text" name="name" value="${ q.name }"
													readonly>
												<div style="float: right; color: black;">${ q.updatedate }</div>
												<br>
												<br> ${ q.content }
												<c:if test="${ !empty q.youtubelink }">
													<iframe id="youtuberealId" width="560" height="315" src=""
														frameborder="0"></iframe>
												</c:if>
											</div>
											<c:if test="${ !empty q.originalname }">
												<tr>
													<td><br>첨부파일</td>
													<td><a
														href="${ pageContext.servletContext.contextPath }/resources/qFileUpload/${ q.changename }"
														download="${ q.originalname }">${ q.originalname }</a></td>
												</tr>
											</c:if>
											<input id="youtubeId" type="hidden" style="width: 300px;"
												name="youtubelink" value="${ q.youtubelink }"> <br>
											<br>
											<br>
											<br>
											<br>
											<div id="btns" align="center">
												<c:if test="${ mem.name eq q.name }">
													<button type="submit"
														class="btn waves-effect waves-light btn-rounded btn-info">수정</button>
													<button type="button" id="qDel"
														class="btn waves-effect waves-light btn-rounded btn-danger">삭제</button>
												</c:if>
												<!-- <button type="button" onclick="window.history.back()">취소</button> -->
												<!-- 나중에 답변하기 버튼은 선생님만 보이게 처리하기 -->
												<c:if
													test="${empty q.replycontent && mem.typee eq 't' && mem.m_no eq lec.m_no}">
													<button type="button" onclick="Qre();"
														class="btn waves-effect waves-light btn-rounded btn-info">답변하기</button>
												</c:if>
												<button type="button"
													class="btn waves-effect waves-light btn-rounded btn-info"
													onclick="location.href='question.qu';">목록</button>
												<br>
												<br>
											</div>
											<br>
										</form>
									</div>
									<!-- .events-content -->
								</section>
							</div>
						</div>
					</div>
				</div>
				<!-- row1끝 -->

				<!-- row2시작 (선생님답변 쓰는부분)  -->
				<div class="row">
					<div class="col-2"></div>
					<div class="col-10">
						<div class="card">
							<form id="qOpen" action="qTCInsertReply?q_no=${ q.q_no }"
								method="post" enctype="multipart/form-data">
								<div class="card-body">
									<br> <input size="10" type="text" name="name"
										value="${ qt.tcname }" readonly> <br>
									<br>
									<textarea id="summernote" cols="50" rows="7"
										name="replycontent">${ q.replycontent }</textarea>
									<script>
								      $('#summernote').summernote({
								        tabsize: 2,
								        height:300,
										minHeight: null,
										maxHeight: null,
										focus: true,
										callbacks:{
											
											onImageUpload: function(files, editor, weleditable){
												for(var i = files.length - 1; i >= 0; i--){
													sendFile(files[i], this);
												}
											}
											
										},
										lang:"ko-KR",
								      });
								    </script>
									<br>
									<div style="text-align: center;">
										<button
											class="btn waves-effect waves-light btn-rounded btn-info"
											id="qReOk" type="submit">확인</button>
										<button
											class="btn waves-effect waves-light btn-rounded btn-info"
											type="button" onclick="qReX();">취소</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
						<!-- row2끝 -->
						<!-- row3시작 (선생님답변 올린부분) -->
			<c:if test="${!empty q.replycontent}">
						<div class="row">
						<div class="col-lg-2"></div>
							<div class="col-lg-10">
								<div class="card">
									<div class="card-body" style="padding-left: 40px; padding-right: 40px;">
										<section class="cd-horizontal-timeline loaded">

											<!-- .timeline -->
											<div class="events-content">
												<form class="c1" id="qOpen1" method="post"
													enctype="multipart/form-data">
													<br> <br>
													<br>
													<div class="selected">
														<!-- <h3 style="font-size: 18px; font-weight:bold;"><img width="55" src="resources/siraFile/Q2.png">&nbsp;&nbsp;&nbsp;학생질문</h3> -->
														<br> <img width="60" src="resources/siraFile/A2.png">&nbsp;&nbsp;&nbsp;<span
															style="font-weight: bold; font-size: 25px; color: black;"
															size="20">선생님 답변</span>
														<hr class="mt-4">
														<input size="10" style="color: black;" type="text"
															name="name" value="${ qt.tcname }" readonly>
														<div style="float: right; color: black;">${ q.replydate }</div>
														<br>
														<br> ${ q.replycontent }
														<c:if
															test="${ mem.typee eq 't' && mem.m_no eq lec.m_no }">
															<br>
															<div style="text-align: center;">
																<button
																	class="btn waves-effect waves-light btn-rounded btn-info"
																	type="button" onclick="qReUpdate();">수정</button>
															</div>
															<br>
															<br>
														</c:if>
													</div>
													<br>
												</form>
											</div>
											<!-- .events-content -->
										</section>
									</div>
								</div>
							</div>
						</div>
						<!-- row3끝 -->
						<!-- row4시작 (댓글리스트부분) -->
					<div id="dat">
					<div class="row">
						<div class="col-lg-2"></div>
						<div class="col-lg-10">
						<div class="card">
							<div class="card-body">
							<div id="replyArea">
							<div id="replyAreaChildren">
								<table id="demo-foo-pagination" align="center" cellspacing="0">
									<input type="hidden" id="q_nohidden" name="q_no" value="${ q.q_no }">
												<c:if test="${ qRListCount ne 0 }">
												댓글(${ qRListCount })
												<hr>
													<c:forEach items="${ qRList }" var="qr">
													<!-- 	<table border="1"> -->
															<tr align="center">
																<td style="width: 20px;margin-left:auto; margin-right:auto;">${ qr.r_no }</td>
																<td style="width: 70px;">${ qr.name }</td>
																<td style="width: 400px;">
																	<textarea class="textAreaRe" cols="38"readonly>${ qr.content }</textarea></td>
																<td>${ qr.updatedate }</td>
																<c:if test="${ qr.m_no eq mem.m_no }">
																	<td>
																		<button class="qrBtn btn btn-secondary btn-outline" type="button">
																			<span class="docs-tooltip">
																				<span class="fas fa-trash"></span>
																			</span>
																		</button>
																	</td>
																</c:if>
															</tr>
													<!-- 	</table> -->
													</c:forEach>
												</c:if>
												<c:if test="${ qRListCount eq 0 }">
													<div style="text-align:center">아직 작성된 댓글이 없습니다.</div>
												</c:if>
										</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
						<!-- row4끝 -->
						<!-- row5시작 (댓글 등록하는 칸부분) -->
						<div class="row">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
						<div>
						<textarea style="border: 1px solid black;" cols="60" rows="3" id="repl" cols="50" rows="2" name="content"></textarea>
						<button class="btn waves-effect waves-light btn-info" style="height:47px; margin-left:auto; margin-right:auto; margin-top:-55px;" id="datUp" type="submit" onclick="qRestartInsert()">댓글등록</button>
						</div>
						</div>
						</div>
					</div>
				</c:if>
				</div>
					
					<!-- row5끝 -->
				</div>
				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->





















<%-- 






			<!-- 제목, 내용, 작성자, 첨부파일정보 -->
	<jsp:include page="../include/header.jsp"/>
	<!-- 여기 작성자부분 수정전엔 뜨는데 수정다하고 상세보기다시오면 못뜸 -> 다시올떈 url에 name값사라져있음 -->
	<br><br><br>
			<!-- <h1 align="center">상세보기 페이지</h1> -->
			<br>
	<form class="c5" action="qupdateForm.qu?q_no=${ q.q_no }" method="post" enctype="multipart/form-data">
		<h3 align="center">학생 질문</h3>
			<table class="t1" align="center">
			<tr>
				<td>제목</td>
				<td><input size="20" type="text" name="title" value="${ q.title }" readonly></td>
				<td>${ q.updatedate }</td>
			</tr>
						<tr>
				<td>작성자</td>
				<td><input size="10" type="text" name="name" value="${ q.name }" readonly></td>
			</tr>
		<tr>
				<td>내용</td>
				<td>${ q.content }
				<iframe id="youtuberealId" width="560" height="315" src="" frameborder="0"></iframe>
				</td>
			</tr>
			<c:if test="${ !empty q.originalname }">
			<tr>
				<td>첨부파일</td>
				<td>
					<c:if test="${ !empty q.originalname }">
						<a href="${ pageContext.servletContext.contextPath }/resources/qFileUpload/${ q.changename }" download="${ q.originalname }">${ q.originalname }</a>
					</c:if>
				</td>
			</tr>
			</c:if>
			 <tr>
				<td><input id="youtubeId" type="hidden" style="width:300px;" name="youtubelink" value="${ q.youtubelink }"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<c:if test="${ mem.name eq q.name }">
					<button type="submit">수정</button>
					<button type="button" id="qDel">삭제</button>
					</c:if>
					<!-- <button type="button" onclick="window.history.back()">취소</button> -->
					<!-- 나중에 답변하기 버튼은 선생님만 보이게 처리하기 -->
					<c:if test="${empty q.replycontent && mem.typee eq 't' && mem.m_no eq lec.m_no}">
					<button type="button" onclick="Qre();">답변하기</button>
					</c:if>
					
					<button type="button" onclick="location.href='question.qu';">목록</button>
					<br><br>
				</td>
			</tr>
		</table>
	</form>
	<br>


			<!-- 질문게시판에 선생님이 답변달았을때의 insert form 사실상update-->
		<form id="qOpen" action="qTCInsertReply?q_no=${ q.q_no }" method="post" enctype="multipart/form-data">
		<table align="center">
						<tr>
				<td>작성자</td>
				<!-- 접속한 아이디는 mem.getId()쓰면되는데 이름을 따로알아와보자 -->
				<td><input size="10" type="text" name="name" value="${ qt.tcname }" readonly></td>
			</tr>
			 <tr>
				<td>내용</td>
				<td><textarea id="summernote" cols="50" rows="7" name="replycontent">${ q.replycontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button id="qReOk" type="submit">확인</button>
					<button type="button" onclick="window.history.back()">취소</button>
					<button type="button" onclick="qReX();">취소</button>
					<br><br>
				</td>
			</tr>
		</table>
	</form>
	


			<!-- 값얻어온다음에 조건값에 메소드값으로 바꾸기 -->
			<c:if test="${!empty q.replycontent}">
				<form class="c1" id="qOpen1" method="post"
					enctype="multipart/form-data">

					<h3 align="center">선생님 답변</h3>

					<table class="t1" align="center">
						<tr>
							<td>작성자</td>
							<!-- 여기도 선생님 이름 위에서 알아오면 적어놓자 -->
							<td><input size="10" type="text" name="name"
								value="${ qt.tcname }" readonly></td>
							<td>${ q.replydate }</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${q.replycontent }</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<!-- 수정버튼은 작성한 해당선생님만 볼 수 있게 -->
								<c:if test="${mem.typee eq 't' && mem.m_no eq lec.m_no }">
									<br>
									<button type="button" onclick="qReUpdate();">수정</button>
								</c:if>
							</td>
						</tr>
					</table>
				</form>
				<br>



				<!-- 댓글 리스트 조회한것-->
	<div id="dat">
	<input type="hidden" id="q_nohidden" name="q_no" value="${ q.q_no }">
	<div id="replyArea">
	<div id="replyAreaChildren" style="width:623px; margin-left:auto; margin-right:auto; border:1px solid black;">
		<c:if test="${ qRListCount ne 0 }">
		<table border="1" style="width:623px;">
		<tr>
			<td colspan="3">댓글(${ qRListCount })</td>
		</tr>
		</table>
	<c:forEach items="${ qRList }" var="qr">
		<table border="1">
			<tr align="center">
				<td style="width:20px;">${ qr.r_no }</td>
				<td style="width:70px;">${ qr.name }</td>
				<td style="width:310px;"><textarea class="textAreaRe" cols="38" rows="1" readonly>${ qr.content }</textarea></td>
				<td>${ qr.updatedate }</td>
				<c:if test="${ qr.m_no eq mem.m_no }">
				<td>
					<button class="qrBtn" type="button">X</button>
				</td>
				</c:if>
			</tr>
		</table>
	</c:forEach>
	</c:if>
	</div>
	</div>


	<br>
	<!-- 댓글 등록칸 -->
	<table align="center">
	<tr>
		<td>
			<textarea style="border:1px solid black;" id="repl" cols="50" rows="2" name="content"></textarea>
		</td>
		<td>
			<button style="height:47px;" id="datUp" type="submit" onclick="qRestartInsert()">댓글등록</button>
		</td>
	</tr>
	</table>
	</div>
			<br><br><br>
	</c:if>



 --%>


				<script>
	
/* 		$(document).ready(function(){
			$("#summernote").summernote({
				height:300,
				minHeight: null,
				maxHeight: null,
				focus: true,
				
				callbacks:{
					
					onImageUpload: function(files, editor, weleditable){
						for(var i = files.length - 1; i >= 0; i--){
							sendFile(files[i], this);
						}
					}
					
				},
				lang:"ko-KR",
				placeholder: '※ 이 게시판은 수업시간에 궁금했던점들을 선생님께 질문할수있는 질문게시판입니다. 도배, 욕설 및 부적절한 내용을 올릴 경우 신고 및 삭제될 수 있습니다. 참고하여 작성해주세요.'
				
			});
			
		}); */
		
		function sendFile(file, el){
			var form_data = new FormData();
			form_data.append("file", file);
			
			$.ajax({
				data: form_data,
				type: "POST",
				url: "qImgUpload.aj",
				cache: false,
				contentType: false,
				enctype: "multipart/form-data",
				processData: false,
				success: function(img_name){
					console.log("ajax통신 성공")
					$(el).summernote("editor.insertImage", img_name);
				}, error: function(){
					console.log("ajax통신 실패");
				}
			});
			
		}
		
		function Qre(){
			$("#qOpen").attr("style","display:block");
		}
		
		$("#qDel").click(function(){
			if(confirm("삭제하시겠습니까?") == true){
				location.href='qdelete.qu?q_no=${ q.q_no }&lec_no=${ q.lec_no }';
			}else{
				false;
			}
		});
		
		function qReX(){
			//$("#summernote").remove();
			//$("textarea[name=summernote]").text("");
			if(confirm("작성한 내용이 사라집니다. 페이지에서 나가시겠습니까?") == true){
				$("#qOpen").attr("style","display:none");
				location.reload();
			}else{
				return false;
			}
		}
		
		function qReUpdate(){
			$("#qOpen1").attr("style","display:none");
			$("#dat").attr("style","display:none");
			$("#qOpen").attr("style","display:block");
		}
		
		$(document).on("click", ".qrBtn", function(){
			var r_no = $(this).parent().parent().children().eq(0).text();
			//alert(r_no);
			if(confirm("삭제하시겠습니까?") == true){
				$.ajax({
					data: {r_no:r_no},
					type: "POST",
					url: "deleteDatReply.re",
					success: function(success){
						console.log("ajax통신 성공")
						
						if(success=="success"){
							console.log("댓글삭제성공");
							qRestart();
							webSocket.send("댓글삭제성공");
						}else{
							alert("댓글등록실패")
						}
						
					}, error: function(){
						console.log("ajax통신 실패");
					}
				});
			}else{
				false;
			}
			
			
		});
		
	</script>


				<script>
	
		// 다시 리로드 구역정하기 // 호출해서 쓰자
		function qRestart(){
			// replyArea안에있는 replyAreachildered를 리로드하겠다. 부모 안에 자식을 리로드
			$('#replyArea').load("qdetail.qu?q_no=${q.q_no} #replyAreaChildren");
		}
		
		// 댓글 등록
		function qRestartInsert(){
			//var q_no = $("#q_nohidden").val();
			var content = $("#repl").val();
			
			$.ajax({
				data: {
					q_no:${q.q_no},
					content:content
				},
				type: "POST",
				url: "qReplyInsert.re",
				success: function(success){
					console.log("ajax통신 성공")
					
					if(success=="success"){
						console.log("댓글등록성공");
						qRestart();
						$("#repl").val("").focus();
						webSocket.send("댓글성공");
					}else{
						alert("댓글등록실패")
					}
					
				}, error: function(){
					console.log("ajax통신 실패");
				}
			});
		}
		
		
		$(function(){
			var youtubeIdChange = $("#youtubeId").val();
			var youtubeId = youtubeIdChange.replace('watch?v=','embed/');
			$("#youtuberealId").attr("src", youtubeId);
		});
		
		
		
		
		
/* 		function qrUpdateBtn(){
			$("#textAreaRe").removeAttr("readonly");
		}
		 */
/* 		$("#qrUpdateBtn").click(function(){
			$(.textAreaRe).click(function(){
				$(this).removeAttr("readonly");
			});
		}); */
		
/* 		$(document).ready(function(){
			$(".qrUpdateBtn").click(function(){
				$(this).click(function(){
					$(".textAreaRe").removeAttr("readonly");
				});
			});
		});
		
		
		$(".qrUpdateBtn").click(function(){
			$(this).append("")
		}); */
		
/* 		$("#qrUpdateBtn").click(function(){
			$("#textAreaRe").removeAttr("readonly");
		}); */
		
		
	</script>






				<!-- header에 있는 jquery 충돌 방지 -->
				<script src='jquery-3.2.1.js'></script>

				<script>
   
   var jq132 = jQuery.noConflict();
   
   </script>



				<!-- footer -->
				<footer class="footer">
					<%@ include file="../include/bfooter.jsp"%>
				</footer>
				<!-- End footer -->
		</div>
		<!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../include/bjs.jsp" %>







<script type="text/javascript">
//WebSocketEx는 프로젝트 이름
//websocket 클래스 이름"ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/${cp}/count/websocket"
var webSocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/arp/websocket");
//"ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/arp/websocket"
var messageTextArea = document.getElementById("messageTextArea");
//웹 소켓이 연결되었을 때 호출되는 이벤트
webSocket.onopen = function(message){
console.log("연결성공flekd")
};
//웹 소켓이 닫혔을 때 호출되는 이벤트
webSocket.onclose = function(message){
	console.log("연결닫힘www")
};
//웹 소켓이 에러가 났을 때 호출되는 이벤트
webSocket.onerror = function(message){
	console.log("연결에러ww")
};
//웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트
webSocket.onmessage = function(message){
console.log(message)
qRestart();
}; 
//Send 버튼을 누르면 실행되는 함수
function sendMessage(){
var message = document.getElementById("textMessage");
messageTextArea.value += "Send to Server => "+message.value+"\n";
//웹소켓으로 textMessage객체의 값을 보낸다.
//webSocket.send(message.value);
//textMessage객체의 값 초기화
message.value = "";
}
//웹소켓 종료
function disconnect(){
webSocket.close();
}
</script>









</body>
</html>