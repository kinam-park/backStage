<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div class="w1100">
		<div style="height:40px;"></div>
			<div id="write">
			
				<textarea name="editor1" if="editor1" rows="10" cols="80"></textarea>
				
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
    		
    		var editor_config = {
    				resize_enabled : false,
    				enterMode : CKEDITOR.ENTER_BR,
    				shiftEnterMode : CKEDITOR.ENTER_P,
    				removePlugins : "elementspath",
    				filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/uploadImage"
    		};
    		
    		var editor = CKEDITOR.replace('editor1',editor_config);
//     		var editor = CKEDITOR.replace('editor1',{
//     			width:'100%',
//     			height:'400px',
//     			filebrowserImageUploadUrl:'${pageContext.request.contextPath}/admin/uploadImage'
//     		});
    		
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
    		
    		$('#write .btn_wrap .btn_wp .submitBtn').off('click').on('click',function(){
    			editor.getData();
    		});
    		
    	});
		
		 
    </script>
    
<jsp:include page='/include/footer'  flush="false" />