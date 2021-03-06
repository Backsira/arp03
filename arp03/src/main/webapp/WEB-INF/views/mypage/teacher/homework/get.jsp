<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../../include/bhead.jsp"%>
	
	<!-- 수식 -->
	<script type="text/x-mathjax-config">
      MathJax.Hub.Config({
        tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
      });
    </script>
	<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
	<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
	
	<style>
		.rightAnswer{
			background-image:url('resources/image/circle.png');
			background-repeat: no-repeat;
			background-position:center center;
			background-size:contain;
		}
		.wrongAnswer{
			background-image:url('resources/image/x.png');
			background-repeat: no-repeat;
			background-position:center center;
			background-size:contain;
			background-color: rgba( 255, 255, 255, 0.5 );
		}
	</style>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Preloader - style you can find in spinners.css -->
 	<%@ include file="../../../include/bpreloader.jsp" %> 
	<!-- End of Preloader - style you can find in spinners.css -->
	
	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../../../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../../../include/bsidebar.jsp" %>
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
                        <h3 class="text-themecolor mb-0 mt-0">Lecture List</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${cp }">Home</a></li>
                            <li class="breadcrumb-item"><a href="lectureList.ad">Lecture List</a></li>
                            <li class="breadcrumb-item"><a href="main.lec?lec_no=${lec.lec_no }">${lec.title }</a></li>
                            <li class="breadcrumb-item"><a href="homeworklist.lec">숙제</a></li>
                            <li class="breadcrumb-item active">숙제풀기</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>THIS MONTH</small></h6>
                                    <h4 class="mt-0 text-info">$58,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="monthchart"></div>
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>LAST MONTH</small></h6>
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
                	<%@ include file="../../../include/blecturemenu.jsp" %>
                	
                    <!-- column -->
                    <div class="col-10">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">숙제 풀기</h4>
                                <div class="table-responsive">
                                    <table id="homework" class="table">
                                        <thead>
                                            <tr>
                                                <th width="50%">문제</th>
                                                <th width="50%">정답</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="p" items="${plist }" varStatus="i">
                                        		<tr>
                                        			<td>${p.problem }</td>
													<td>
														<c:if test="${empty alist }">
															답:<input data-p_no="${p.p_no }">
														</c:if>
														<c:if test="${!empty alist }">
															제출답:\(${alist[i.index].answer }\)
														</c:if>
													</td>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <c:if test="${mem.typee eq 's' && (empty alist || alist.size()==0) }">
								<button class="btn btn-success" onclick="ok()">제출</button>
								</c:if>
								<%-- <c:if test="${alist.size()>0 }"> --%>
								<a class="btn btn-success" href="homeworklist.lec">목록</a>
								<%-- </c:if> --%>
                           	</div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->








		<!-- footer -->
        <footer class="footer">
            <%@ include file="../../../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../../../include/bjs.jsp" %>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<%-- ${hw }<br>
<c:forEach var="p" items="${plist }" varStatus="i">
	문제:${p.problem }<br>
	<c:if test="${empty alist || alist.size()==0 }">
	답:<input data-p_no="${p.p_no }"><br>
	</c:if>
	<c:if test="${alist.size()>0 }">
	답:\(${alist[i.index].answer }\)<br>
	정답:${p.solution }<br>
	정답?:${alist[i.index].ox }
	</c:if>
	<br>
</c:forEach>

	<c:if test="${empty alist || alist.size()==0 }">
	<button onclick="ok()">제출</button>
	</c:if>
	<c:if test="${alist.size()>0 }">
	<a href="homeworklist.lec">목록</a>
	</c:if> --%>

<script>
	function ok(){
		var flag=false;
		$('#homework input').each(function(index){
			var p_no=$(this).data('p_no')
			var hw_no=${hw.hw_no}
			var answer=$(this).val();
			
			$.ajax({
				url:'submitAnswer.hw',
				type:'post',
				async:'true',
				data:{
					p_no:p_no,
					hw_no:hw_no,
					answer:answer,
				},
				success:function(data){
					if(data=="success"){
						
					}else{
						flag=true;
					}
				},
			})
		})
		if(flag){
			alert("실패")
		}else{
			alert("제출완료")
			location.href="homeworklist.lec"
		}
	}
</script>
</body>
</html>