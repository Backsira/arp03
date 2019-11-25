<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String[] list = request.getParameterValues("bfList");
%>
<!DOCTYPE html>
<html>
<!-- <script src="https://code.jquery.com/juqery-3.1.0.min.js" type="text/javascript"></script> -->

<head>
<%@ include file="../include/bhead.jsp"%>
<meta charset="UTF-8">
<style>
	#formDiv{
		text-align:left;
		margin-left:auto;
		margin-right:auto;
		width:800px
		}
		
	
	
</style>

<title>게시판 작성하기 </title>
</head>

<body>
<!-- Topbar header - style you can find in pages.scss -->
	<header class="topbar">
		<%@ include file="../include/btopbarheader.jsp"%>
	</header>
	<!-- End Topbar header -->

	<!-- Left-sidebar -->
	<aside class="left-sidebar">
		<%@ include file="../include/bsidebar.jsp"%>
	</aside>
	<!-- End of Left-sidebar -->


<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
 <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>



	<jsp:include page="../include/header.jsp"/>
	
	<div class="page-wrapper">
		<div class="card">
	 	<c:if test="${ !empty b }">
			<h3 align="center">글 수정하기</h3>
			
			<div align="center" id="formDiv">
			
				<form action="tbupdate.do" method="post" enctype="multipart/form-data">
	
					<div class="form-material">
						<input type="text" name="title" id="title" required placeholder="제목을 입력해주세요" value="${b.title }" class="form-control"><br>
                     </div>
				

				
			
				<input type="hidden" name="b_no" value="${ b.b_no }">
				<input type="hidden" name="m_no" value="${ b.m_no }">
					<br>
		
					<label>첨부파일</label>
			
				<input type="file" name="reloadFile" id="file" multiple="multiple"> 
				<div id="fileArea">
				
				</div>
				
				<c:if test="${ !empty bfList }">
				<c:forEach items="${ bfList }" var="bfList">
				
					<input type="hidden" class="original_filename" name="original_filename"  value="${ bfList.original_filename }">
					<input type="hidden" id="rename" value="${ bfList.rename_filename }">
					
					<div id="delDiv">
					 <a id="fileName" href="${ pageContext.servletContext.contextPath }/resources/tbuploadFiles/${bfList.rename_filename}" download="${ bfList.original_filename }">${ bfList.original_filename }</a>
					 <input type="hidden" name="fileStatus" value="${ bfList.original_filename }">
                	  <button type="button" class="delBtn">파일삭제</button>
					</div>
				
				</c:forEach>
					</c:if>
			
			
			
				<textarea id="summernote" cols="50" rows="7" name="content" id="content" required>${ b.content }</textarea>
		
				
		
				<div align="center">
						<button type="submit" id="subBtn" class="btn waves-effect waves-light btn-info">수정하기</button> 
						<button type="button" onclick="location.href='tblist.do';" class="btn waves-effect waves-light btn-info">목록으로</button>
			
				</div>
				<br><br><br>
	
		</form>
		</c:if>
			</div>
	</div>
</div>		 
	
	
	 <script>
	 $(document).ready(function() {
         $('#summernote').summernote({ // summernote를 사용하기 위한 선언
        
             height: 400,
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
	            	 input.id="upFileName"+i;
	            	 input.style="none";
	            	 fileArea.appendChild(input);
	            	 fileArea.appendChild(br);

	   
	                 file = files[i];
	                 $("#upFileName"+i).val(file.name);
	            }
	                
	        
	              
	         });
	  
	     });
		
	
	 
	</script>
	
	 <!--  헤더 제이쿼리 충돌 방지  -->
	<script src='jquery-3.2.1.js'></script>
	
	<script>
	
	var jq132 = jQuery.noConflict();

	
	</script>
	
<!-- 	<script>
		var form = document.forms[0];
		var fileArea = document.getElementById("fileArea");
		var num =2;
	
		$("#addBtn").on("click", function(){
		if(num < 6){
			var element = document.createElement("input");
			element.type="file";
			element.name="uploadFile"+num;
			num++;
			
			fileArea.appendChild(element);
		
		}else{
			alert("파일첨부는 5개까지 가능합니다");
		}
	});	
		$("#deleteBtn").on("click",function(){
			if(num > 2){
				num--;
				var inputs = fileArea.getElementsByTagName('input');
				fileArea.removeChild(inputs[inputs.length-1]);
			
			}
		});
		
	form.onsubmit=function(){
		var inputs = fileArea.getElementsByTagName('input');
		event.preventDefault(); // 일단 정지
		for(var i=0; i<inputs.length; i++){
			if(inputs[i].value== ""){
				alert((i+1)+"번째파일을 선택해주세요");
				inputs[i].focus();
				return;
			}
		}
		
		this.submit();
	}
	
	</script> -->
	 
	
	
	
  

</body>
 

</html>