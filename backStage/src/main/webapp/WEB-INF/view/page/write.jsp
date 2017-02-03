<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div class="w1200">
		<div style="height:40px;"></div>
			<div id="write">
				<div class="category_wrap">
					<div class="wp text bold fl">CATEGORY</div>
					<div class="clear"></div>
				</div>
				<div class="title_wrap">
					<div class="wp text bold fl">TITLE</div>
					<input class="wp inputTitle fl" placeholder="input title"/>
					<div class="clear"></div>
				</div>
				<div class="content_title bold">CONTENTS</div>
				<textarea class="inputContents" name="editor1" if="editor1" rows="10" cols="80"></textarea>
				
				<div class="btn_wrap">
					<div class="btn_wp">
						<div class="btn submitBtn fl bold cp">submit</div>
						<div class="btn cancelBtn fl bold cp">cancel</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>		
			</div>
			<div style="height:40px;"></div>
	</div>
	
	
    <script>
    
    	$(function(){
    		var category = sessionStorage.getItem('category');
    		pageCode = location.href.split('#')[1];
    		console.log("::pageCode::",pageCode);
    		if(pageCode != null){
    			getContents(pageCode);
    		}
    		if(category != null){
    			$('#write .category_wrap .text').html( category );
    		}
			//ckeditor    		
    		var editor_config = {
    				width:'100%',
    				height:'500px',
    				resize_enabled : false,
    				enterMode : CKEDITOR.ENTER_BR,
    				shiftEnterMode : CKEDITOR.ENTER_P,
    				removePlugins : "elementspath",
    				filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/uploadImage"
    		};
    		var editor = CKEDITOR.replace('editor1',editor_config);
    		CKEDITOR.on('dialogDefinition',function(ev){
    			var dialogName = ev.data.name;
    			var dialogDefinition = ev.data.definition;
    			switch(dialogName){
    			case 'image':
    				dialogDefinition.removeContents('LINK');
    				dialogDefinition.removeContents('advanced');
    				break;
    			}
    		});	
    		
    		writeListener();
    		
    		
    	});
    	
    	function getContents(code){
    		$.ajax({
				url : base_url + "contents/getContents.json",
				type : "POST",
				data : {contents_id:code},
				success : function(data){
					drawContents(data.result);
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function drawContents(data){
    		$('#write .category_wrap .text').html(data.category_code);
    		$('#write .inputTitle').val(data.title);
    		CKEDITOR.instances.editor1.setData(data.contents);
    		category = data.category_code;
    	}
    	
    	function insertContents(params){
    		console.log(params);
    		$.ajax({
    			url : base_url + "contents/insertContents.json",
    			type : "POST",
    			data : params,
    			success : function(data){
// 					console.log(data);
					if(data.result == true){
						alert('게시물을 성공적으로 게시하였습니다.');
						location.href = sessionStorage.getItem('category').toLowerCase();
					}
    			},
    			error : function(err){
    				console.log("error");
    				console.log(err);
    			}
    		});
    	};
    	function updateContents(params){
    		$.ajax({
    			url : base_url + "contents/updateContents.json",
    			type : "POST",
    			data : params,
    			success : function(data){
// 					console.log(data);
					if(data.result == true){
						alert('게시물을 성공적으로 수정하였습니다.');
						location.href = category.toLowerCase();
					}
    			},
    			error : function(err){
    				console.log("error");
    				console.log(err);
    			}
    		});
    	}
    	
    	
    	function writeListener(){
    		$('#write .btn_wrap .btn_wp .submitBtn').off('click').on('click',function(){
   			if( pageCode != null ){ // write
    			var params = {
    					contents_id : pageCode,
    	    			title : $('#write .inputTitle').val(),
    	    			contents : CKEDITOR.instances.editor1.getData(),
    	    			category_code : category,
    	    			is_enable : 'Y'		
    			};
   				updateContents(params);
   			}else{ // update
   				var params = {
    					user_id : sessionStorage.getItem('user_id'),
    	    			category_code : sessionStorage.getItem('category'),
    	    			title : $('#write .inputTitle').val(),
    	    			contents : CKEDITOR.instances.editor1.getData(),
    	    			is_enable : 'Y'		
    			};
   				insertContents(params);
   			}
    			
    			
    		});
    		
    		$('#write .btn_wrap .btn_wp .cancelBtn').off('click').on('click',function(){
    			location.href = category.toLowerCase();
    		});
    	}
		
		 
    </script>
    
<jsp:include page='/include/footer'  flush="false" />