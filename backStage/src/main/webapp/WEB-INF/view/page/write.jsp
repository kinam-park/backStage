<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div class="w1100">
		<div style="height:40px;"></div>
			<div class="category_wrap">
				<select>
					<option/>NEWS
					<option/>COLLECTION
				</select>
			</div>
			
			<div id="write">
				<div class="title">
					<input class="inputTitle" placeholder="input title"/>
				</div>
				<textarea class="inputContents" name="editor1" if="editor1" rows="10" cols="80"></textarea>
				
				<div class="btn_wrap">
					<div class="btn_wp fl">
						<div class="btn submitBtn fl cp">submit</div>
						<div class="btn cancelBtn fl cp">cancel</div>
					</div>
					<div class="clear"></div>
				</div>		
			</div>
	</div>
	
	
    <script>
    
    	$(function(){
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
    		
    		
    		listener();
    		
    		
    	});
    	
    	function insertContents(title,contents){
    		$.ajax({
    			url : base_url + "contents/insertContents.json",
    			type : "POST",
    			data : {category_name:params.category,user_id:params.userId,title:params.title,contents:params.contents},
    			success : function(data){

    			},
    			error : function(err){
    				console.log("error");
    				console.log(err);
    			}
    		});
    	};
    	
    	
    	function listener(){
    		$('#write .btn_wrap .btn_wp .submitBtn').off('click').on('click',function(){
    			var params = {};
    			params.userId = 1;
    			params.category = $('.category_wrap select').children(':selected').val();
    			params.title = $('#write .inputTitle').val();
    			params.contents = CKEDITOR.instances.editor1.getData();
    			insertContents(params);
    		});
    	}
		
		 
    </script>
    
<jsp:include page='/include/footer'  flush="false" />