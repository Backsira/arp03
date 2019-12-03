<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String[] list = request.getParameterValues("bfList");
%>
<!DOCTYPE html>
<html>
<%@ include file="../include/bhead.jsp"%>
<head>

<meta charset="UTF-8">
<style type="text/css">

#file {
	display: none;
}
</style>



<title>게시글 작성하기</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	type="text/javascript"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
</head>

<body class="fix-header card-no-border logo-center">
<body class="fix-header card-no-border logo-center">
	<%@ include file="../include/bpreloader.jsp"%>

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
						<h3 class="text-themecolor mb-0 mt-0">선생님게시판</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
							<li class="breadcrumb-item active">선생님게시판</li>
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

				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">글작성하기</h4>

								<form method="post" id="MultiUpload" action="insertTBoard.do"
									enctype="multipart/form-data" id="boardInsertForm">

									<input name="m_no" value="${mem.m_no}" type="hidden">
									<div class="form-material">
										<input type="text" name="title" id="title" required
											placeholder="제목을 입력해주세요" value="${b.title }"
											class="form-control"><br>
									</div>
									<br>
									<input type="hidden" name="m_no"
										value="${ mem.m_no }">

									

										<input type="file" name="file" id="file" multiple="multiple">
										<label for="file" class="btn btn-warning">파일첨부</label>
										<div id="fileArea"></div>
								

									<textarea id="summernote" cols="50" rows="7" name="content"
										id="content" required>${b.content }</textarea>
									<br>
									<div align="center">
										<button type="submit" id="subBtn"
											class="btn waves-effect waves-light btn-info">등록하기</button>
										<button type="button"
											class="btn waves-effect waves-light btn-info"
											onclick="location.href='tblist.do';">목록으로</button>
									</div>
								</form>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>





<script>
	$(function(){
         $('#summernote').summernote({ // summernote를 사용하기 위한 선언
        
             height: 400,
             minHeight: null,
				maxHeight: null,
				focus: true,
				
				callbacks: { // 콜백을 사용
                 // 이미지를 업로드할 경우 이벤트를 발생
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
	           url:"imageUpload.do",
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
	     
	     $(".delBtn").on("click", function(){
	    	 
	         var this_=$(this)
	        	
	         var rename = $(this_).parent().prev().val();
	         
	         console.log(rename);
	   
	            $.ajax({
	               url:"tbdeleteFile.do",
	               data:{rename_filename : rename},
	               success:function(data){
	                     
	                  if(data == "success"){
	                     console.log("성공");
	                     
	                     
	                     $(this_).parent().prev().remove()
	                     $(this_).parent().prev().remove()  
	                     $(this_).parent().remove() 
	                    
	                
	                     
	                    
	                  }else{
	                     alert("파일 삭제 실패");
	                  }
	                  
	               },error:function(){
	                  
	                  console.log("ajax 통신 실패");
	               }
	            });
	            
	         }); 
	       
	     
		// 파일업로드 리스트 보여주기		
	     $(document).ready( function() {
	    	 
	    	   var fileArea = document.getElementById("fileArea");
	    	   
	    	 
	         $("input[type=file]").change(function () {
	             
	             var fileInput = document.getElementById("file");
	    
	              
	             var files = fileInput.files;
	             var file;
	             
	             $("input[type=file]").on("click",function(){
	            	
	            	 while ( fileArea.hasChildNodes() ) { 
	            		 fileArea.removeChild( fileArea.firstChild ); 
	            		 }

	             });
	          	
	             for (var i = 0; i < files.length; i++) {
	            	 
	            	 var input = document.createElement("input");
	            	 var br = document.createElement("br");
	            	 input.type="text";
	            	 input.class="filname";
	            	 input.id="upFileName"+i;
	            	 input.style="border:none";
	            	 input.size="100"
	            	 fileArea.appendChild(input);
	            	 fileArea.appendChild(br);

	   
	                 file = files[i];
	                 $("#upFileName"+i).val(file.name);
	            }
	                
	        
	              
	         });
	  
	     });
	 	</script>


<%@ include file="../include/bjs.jsp"%>



<script>
    $(document).ready(function() {
        // Basic
        $('.dropify').dropify();

        // Translated
        $('.dropify-fr').dropify({
            messages: {
                default: 'Glissez-déposez un fichier ici ou cliquez',
                replace: 'Glissez-déposez un fichier ou cliquez pour remplacer',
                remove: 'Supprimer',
                error: 'Désolé, le fichier trop volumineux'
            }
        });

        // Used events
        var drEvent = $('#input-file-events').dropify();

        drEvent.on('dropify.beforeClear', function(event, element) {
            return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
        });

        drEvent.on('dropify.afterClear', function(event, element) {
            alert('File deleted');
        });

        drEvent.on('dropify.errors', function(event, element) {
            console.log('Has Errors');
        });

        var drDestroy = $('#input-file-to-destroy').dropify();
        drDestroy = drDestroy.data('dropify')
        $('#toggleDropify').on('click', function(e) {
            e.preventDefault();
            if (drDestroy.isDropified()) {
                drDestroy.destroy();
            } else {
                drDestroy.init();
            }
        })
    });
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


<%-- <%@ include file="../include/bjs.jsp"%> --%>





</body>
</html>