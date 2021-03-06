<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/bhead.jsp"%>
<!-- include summernote css/js -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script> -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->
<!-- include summernote css/js-->

<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

include summernote css/js
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script> -->


<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
<style>
	.card{
		text-align:left;
		margin-left:auto;
		margin-right:auto;
		/* width:1000px; */
	}
</style>
</head>
<body class="fix-header card-no-border logo-center">
	<%@ include file="../include/bpreloader.jsp" %>
	
	<div id="main-wrapper">

	<header class="topbar">
		<%@ include file="../include/btopbarheader.jsp"%>
	</header>
	<!-- End Topbar header -->

	<!-- Left-sidebar -->
	<aside class="left-sidebar">
		<%@ include file="../include/bsidebar.jsp"%>
	</aside>
	<!-- End of Left-sidebar -->

	<div class="page-wrapper">
	
		<div class="container-fluid">
	
	<div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">자유게시판</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item active">자유게시판</li>
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
                
		<div class="row">  
		<div class="col-12">
                        <div class="card">
                            <div class="card-body">
	
	<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
   <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
   <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
   <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>  -->

	<c:if test="${ empty b }">
	<h3 align="center" style="color:black">글쓰기</h3>
	<form action="binsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name=m_no value=${ mem.m_no }>
		<div>
			<div><input type="text" name="title" id="title" class="form-control" required></div>
			<div><textarea cols="50" rows="7" name="content" id="summernote" required></textarea></div><br>
			<div align="center"><button class="btn waves-effect waves-light btn-info" type="button" onclick="location.href='blist.do';">목록으로</button>
					<button class="btn waves-effect waves-light btn-info" type="submit" onclick="check();">등록하기</button></div>
			</div>
	</form>
	</c:if>
	
	<c:if test="${ !empty b }">
	<h3 align="center" style="color:black">글 수정</h3>
	<form action="bupdate.do?b_no=${b.b_no}" method="post" enctype="multipart/form-data">
		<input type="hidden" name=m_no value=${ mem.m_no }>
		<div>
			<div><input type="text" name="title" id="title" class="form-control" value="${ b.title }" required></div>
			<div><textarea cols="50" rows="7" name="content" id="summernote" required>${ b.content }</textarea></div><br>
			<div align="center"><button class="btn waves-effect waves-light btn-info" type="button" onclick="location.href='blist.do';">목록으로</button>
					<button class="btn waves-effect waves-light btn-info" type="submit" onclick="check();">등록하기</button></div>
			</div>
	</form>
	</c:if>
	
					</div>
	
	                            </div>
                        </div>
	
		</div>
			</div>
                         <!-- ============================================================== -->
            			<!-- End Container fluid  -->
            			<!-- ============================================================== -->
	
		 <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
	
	</div>
	
	</div>
	
	<%@ include file="../include/bjs.jsp" %>
	
	 <script>
      $(function(){
  		$("#summernote").summernote({
  			height: 300,
  			fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New' ],
  			fontNamesIgnoreCheck : [ '맑은고딕' ],
  			focus: true,
  			
  			callbacks: {
  				onImageUpload: function(files, editor, welEditable) {
  		            for (var i = files.length - 1; i >= 0; i--) {
  		            	sendFile(files[i], this);
  		            }
  		        }
  			}
  			
  		});

  	});
      
      function sendFile(file, el) {
          var form_data = new FormData();
          form_data.append('file', file);
          $.ajax({
            data: form_data,
            type:"POST",
            url:"image.do",
            cache: false,
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: function(img_name) {
            	//console.log(img_name);
              $(el).summernote('editor.insertImage', img_name);
            },
            error: function(){
            	console.log("ajax 통신 실패");
            }
          });
        }
      
      function check(){
    	  if ($('#summernote').summernote('isEmpty')) {
        	  alert('글 내용을 작성해주세요.');
        	}
      }
      
    </script>
</body>
</html>