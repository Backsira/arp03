<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Preloader - style you can find in spinners.css -->
 	<%@ include file="../include/bpreloader.jsp" %> 
	<!-- End of Preloader - style you can find in spinners.css -->
	
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
                        <h3 class="text-themecolor mb-0 mt-0">Lecture List</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${cp }">Home</a></li>
                            <li class="breadcrumb-item active">Lecture List</li>
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
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">강좌관리</h4>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Teacher</th>
                                                <th>title</th>
                                                <th>dayofweek</th>
                                                <th>place</th>
                                                <th>count</th>
                                                <c:if test="${mem.typee eq 'a' }">
                                                <th>삭제</th>
                                                </c:if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="l" items="${list }">
                                        		<tr>
	                                        		<td>${l.lec_no }</td>
	                                                <td>${l.name }</td>
	                                                <td><a href="main.lec?lec_no=${l.lec_no }">${l.title }</a></td>
	                                                <td>${l.dayofweek }</td>
	                                                <td>${l.place }</td>
	                                                <td>${l.cnt }/${l.headcount }</td>
	                                                <td>
	                                                	<c:if test="${mem.typee eq 'a' && l.status eq 'Y'}">
	                                                		<button class="btn btn-danger" onclick="del(${l.lec_no})">삭제</button>
	                                                	</c:if>
	                                                	<c:if test="${mem.typee eq 'a' && l.status eq 'N'}">
	           	                                     		<button class="btn btn-primary" onclick="cancle(${l.lec_no})">삭제취소</button>
	                                                	</c:if>
	                                                	<c:if test="${mem.typee eq 'a' && l.status eq 'A'}">
	           	                                     		<button class="btn btn-success" onclick="accept(${l.lec_no})">수락</button>
	           	                                     		<button class="btn btn-warning" onclick="reject(${l.lec_no})">거절</button>
	                                                	</c:if>
	                                                	<c:if test="${mem.typee eq 'a' && l.status eq 'R'}">
	           	                                     		<button class="btn">거절</button>
	                                                	</c:if>
	                                                </td>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
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
            <%@ include file="../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../include/bjs.jsp" %>
	
	
	
	
	
<form id="form" method='post'>
	<input type="hidden" name="lec_no">
</form>
<script>
	function del(lec_no){
		var formm=$('#form').attr('action','del.lec')
		formm.children('input').eq(0).val(lec_no)
		formm.submit();
	}
	function cancle(lec_no){
		var formm=$('#form').attr('action','delCancel.lec')
		formm.children('input').eq(0).val(lec_no)
		formm.submit();
	}
	function accept(lec_no){
		var formm=$('#form').attr('action','accept.lec')
		formm.children('input').eq(0).val(lec_no)
		formm.submit();
	}
	function reject(lec_no){
		var formm=$('#form').attr('action','reject.lec')
		formm.children('input').eq(0).val(lec_no)
		formm.submit();
	}
</script>
</body>
</html>