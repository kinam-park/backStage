<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div class="w1100">
		<div style="height:40px;"></div>
			<div id="write">
				
				<textarea name="editor1" if="editor1" rows="10" cols="80"></textarea>
							
			</div>
		<div class="clear"></div>
		
	</div>
	
	
    <script>
		CKEDITOR.replace('editor1',{
			width:'100%',
			height:'400px',
			filebrowserImageUploadUrl:'/image/upload'
		});
		
		CKEDITOR.on('dialogDefinition',function(ev){
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;
			
			switch(dialogName){
			case 'image':
				dialogDefinition.removeContents('info');
				dialogDefinition.removeContents('advanced');
				break;
			}
		});
		 
    </script>
    
