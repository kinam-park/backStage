<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div id="detailPage" class="detailPage_component">
		<div style="height:40px;"></div>
		<div class="w1200">
			<div style="height:20px;"></div>
			<div class="detailPage_area">
				<div class="detailPage_wrap">
					<div class="category bold"></div>
					<div class="head_wrap">
						<div class="wp title"></div>
						<div class="wp created_date"></div>
					</div>
					<div class="content_wrap"></div>
				</div>
				<div class="btn_wrap hide">
					<div class="wp updateBtn bold cp fl">UPDATE</div>
					<div class="wp deleteBtn bold cp fl">DELETE</div>
					<div class="clear"></div>
				</div>
			</div>
		<div style="height:40px;"></div>
	</div>
	
	
    <script>
    	$(function(){
    		var auth = sessionStorage.getItem('auth');
    		if(auth == 'admin'){
    			$('#detailPage .btn_wrap').removeClass('hide');
    		}
    		
    		name = location.href.split('#')[1];
    		getContents(name);
    	});
    	
    	function getContents(name){
    		$.ajax({
				url : base_url + "contents/getContents.json",
				type : "POST",
				data : {contents_id:name},
				success : function(data){
					console.log(data);
					drawContents(data.result);
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function deleteContents(code){
    		$.ajax({
				url : base_url + "contents/deleteContents.json",
				type : "POST",
				data : {contents_id:name},
				success : function(data){
					console.log(data);
					history.back();
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function drawContents(data){
    		$('#detailPage .category').html(data.category_code);
    		$('#detailPage .title').html(data.title);
    		$('#detailPage .created_date').html(data.created_date);
    		$('#detailPage .content_wrap').append(data.contents);
    		detailPageListener();
    	}
    	
    	function detailPageListener(){
    		$('#detailPage .deleteBtn').off('click').on('click',function(){
    			var checkDelete = confirm('해당 컨텐츠를 삭제하시겠습니까?');
    			if(checkDelete == true){
    				deleteContents(name);
    			}
    		});
    		
    		$('#detailPage .updateBtn').off('click').on('click',function(){
    			var checkDelete = confirm('해당 컨텐츠를 수정하시겠습니까?');
    			if(checkDelete == true){
    				location.href = 'write#'+name;
    			}
    		});
    	}
    	
    </script>
    
<jsp:include page='/include/footer'  flush="false" />